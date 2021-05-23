import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.lightGreen,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: colors
                .asMap()
                .entries
                .map((e) => noteButton(num: e.key + 1, color: e.value))
                .toList(),
          ),
        ),
      ),
    );
  }

  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Widget noteButton({required int num, required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () => playSound(num),
        child: Container(color: color),
      ),
    );
  }
}
