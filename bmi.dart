// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';

class BmiSecreen extends StatefulWidget {
  const BmiSecreen({Key? key}) : super(key: key);

  @override
  State<BmiSecreen> createState() => _BmiSecreenState();
}

class _BmiSecreenState extends State<BmiSecreen> {
  final TextEditingController _hightEditingCOntroller = TextEditingController();
  final TextEditingController _wightEditingCOntroller = TextEditingController();

  double _BmiResult = 0.0;
  String _textRestlut = '';
  String _imageRestlut = '';
  bool _colorChick = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.tealAccent,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: const [0.2, 0.32, .6, 0.75, .85, .92],
            colors: (_colorChick == false)
                ? [
                    Colors.white,
                    Colors.red.shade50,
                    Colors.red.shade300,
                    Colors.red.shade400,
                    Colors.red.shade600,
                    Colors.red.shade800,
                  ]
                : [
                    Colors.white,
                    Colors.amber.shade50,
                    Colors.amber.shade300,
                    Colors.amber.shade400,
                    Colors.amber.shade600,
                    Colors.amber.shade800,
                  ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              // backgroundColor: Colors.tealAccent,
              elevation: 0.0,
              title: Text(
                'Body mass index \n calcolater ',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //hight
                      Container(
                        width: 125,
                        child: TextField(
                          controller: _hightEditingCOntroller,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey.shade800,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Hight(m)',
                            hintStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      // wight

                      Container(
                        width: 120,
                        child: TextField(
                          controller: _wightEditingCOntroller,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey.shade800,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Wight(kg)',
                            hintStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      double _hight =
                          double.parse(_hightEditingCOntroller.text);
                      double _wight =
                          double.parse(_wightEditingCOntroller.text);

                      setState(() {
                        _BmiResult = _wight / (_hight * _hight);
                      });

                      if (_BmiResult > 25) {
                        _textRestlut = 'You are OVERWIGHT';
                        _colorChick = false;
                        _imageRestlut = 'assets/overwight.jpg';
                      } else if (_BmiResult >= 18.5 && _BmiResult <= 25) {
                        _textRestlut = 'You have healthy Hight and Wight';
                        _colorChick = true;

                        _imageRestlut = 'assets/good.jpg';
                      } else {
                        _textRestlut = 'You are under  Wight';
                        _colorChick = true;

                        _imageRestlut = 'assets/less.jpg';
                      }
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Calcolate',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    _BmiResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  Visibility(
                    visible: _textRestlut.isNotEmpty,
                    child: Text(
                      _textRestlut,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey.shade800,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Visibility(
                    visible: _imageRestlut.isNotEmpty,
                    child: Image(
                      image: AssetImage(_imageRestlut),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
