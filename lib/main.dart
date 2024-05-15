import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  @override
  void initState() {
    // BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
    //     BetterPlayerDataSourceType.network,
    //     url,
    //     //"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    //     bufferingConfiguration: BetterPlayerBufferingConfiguration(
    //         minBufferMs: 2000,
    //         maxBufferMs: 20000,
    //         bufferForPlaybackMs: 2000,
    //         bufferForPlaybackAfterRebufferMs: 2000
    //     ),
    //     cacheConfiguration: BetterPlayerCacheConfiguration(
    //       useCache: true,
    //       maxCacheSize: 100 * 1024 * 1024,
    //       maxCacheFileSize: 100 * 1024 * 1024,
    //       preCacheSize: 50 * 1024 * 1024,
    //     )
    // );
    // videoPlayerController = BetterPlayerController(
    //     BetterPlayerConfiguration(autoPlay: true, looping: true),
    //     betterPlayerDataSource: betterPlayerDataSource
    // );
    //
    BetterPlayerConfiguration betterPlayerConfiguration = const BetterPlayerConfiguration(
      fit: BoxFit.contain,
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://rent-it.pp.ua/v1/videos/65a28f8e2e6292a8950e3b24/file',
      // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      //todo if use this url https://eng-demo.cablecast.tv/segmented-captions/vod.m3u8 its work
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration, betterPlayerDataSource: _betterPlayerDataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          BetterPlayer(controller: _betterPlayerController),
          TextButton(
            child: const Text("Play video"),
            onPressed: () {
              _betterPlayerController.play();
            },
          ),
        ],
      ),
    );
  }
}
