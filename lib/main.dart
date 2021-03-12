import 'package:flutter/material.dart';
import 'package:tip_calculator_app/util/hexcolor.dart';

void main() => runApp(new MaterialApp(
      home: BillSplitter(),
    ));

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  // private
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple = HexColor("#6908d6");

  @override
  Widget build(BuildContext context) {
    // for responsive size by device
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            // Container Top Display
            Container(
              width: 150,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  color:
                      _purple.withOpacity(0.2), // Colors.purpleAccent.shade100,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Per Person"),
                    Text("\$123"),
                  ],
                ),
              ),
            ),

            // Container Bottom Display

            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      icon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
