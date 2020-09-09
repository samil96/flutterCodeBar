import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:ui';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Codebar',
      home: MyCodeBar(),
    );
  }
}

class MyCodeBar extends StatefulWidget {
  @override
  _MyCodeBarState createState() => _MyCodeBarState();
}

class _MyCodeBarState extends State<MyCodeBar> {
  String _counter, _value = "";
  Future _escanercode() async {
    _counter = await FlutterBarcodeScanner.scanBarcode("#E8EAF6", "Cancelar", true, ScanMode.BARCODE);
    setState(() {
      _value = _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        title: Text("CodeBar"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: FractionalOffset.bottomLeft,
            stops: [0.1,0.2,0.5],
            colors: [
              Colors.cyan[300],
              Colors.cyan[200],
              Colors.cyan[50],
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text(
                  "@96Azul",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.indigo[900],
                  ),
                ),
                subtitle: Text(
                  "El valor del scan es: ",
                   textAlign: TextAlign.center,
                ),
              ),
              Text(
                _value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: _escanercode,
        child: Icon(Icons.settings_overscan_sharp),
      ),
    );
  }
}