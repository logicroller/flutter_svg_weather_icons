import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<String> weatherIcons = <String>[
  'assets/w0.svg',
  'assets/w1.svg',
  'assets/w2.svg',
  'assets/w3.svg',
  'assets/w4.svg',
  'assets/w5.svg',
  'assets/w6.svg',
  'assets/w7.svg',
  'assets/w8.svg',
  'assets/w9.svg',
  'assets/w10.svg',
  'assets/w13.svg',
  'assets/w14.svg',
  'assets/w15.svg',
  'assets/w16.svg',
  'assets/w17.svg',
  'assets/w18.svg',
  'assets/w19.svg',
  'assets/w20.svg',
  'assets/w29.svg',
  'assets/w30.svg',
  'assets/w31.svg',
  'assets/w32.svg',
  'assets/w33.svg',
  'assets/w34.svg',
  'assets/w35.svg',
  'assets/w36.svg',
  'assets/w44.svg',
  'assets/w45.svg',
  'assets/w46.svg',

];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Icons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter SVG Weather Icons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _painters = <Widget>[];
  double _dimension;

  @override
  void initState() {
    super.initState();
    _dimension = 80.0;

    for (String assetName in weatherIcons) {
      _painters.add(
        SvgPicture.asset(assetName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_dimension > MediaQuery.of(context).size.width - 10.0) {
      _dimension = MediaQuery.of(context).size.width - 10.0;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Slider(
            min: 5.0,
            max: MediaQuery.of(context).size.width - 10.0,
            value: _dimension,
            onChanged: (double val) {
              setState(() => _dimension = val);
            }),
        Expanded(
          child: GridView.extent(
            shrinkWrap: true,
            maxCrossAxisExtent: _dimension,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: _painters.toList(),
          ),
        ),
      ]),
    );
  }
}