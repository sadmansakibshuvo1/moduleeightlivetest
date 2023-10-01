import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      home: ImageFeed(),
    );
  }
}

class ImageFeed extends StatelessWidget {
  final List<String> images = List.generate(10, (index) => "https://m.cricbuzz.com/a/img/v1/192x192/i1/c170899/tamim-iqbal.jpg");

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: isPortrait
          ? ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(images[index]),
            ),
          );
        },
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(images[index]),
            ),
          );
        },
      ),
    );
  }
}
