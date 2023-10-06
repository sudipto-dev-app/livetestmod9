import 'package:flutter/material.dart';

void main() {
  runApp(SizeSelectorApp());
}

class SizeSelectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeSelectorScreen(),
    );
  }
}

class SizeSelectorScreen extends StatefulWidget {
  @override
  _SizeSelectorScreenState createState() => _SizeSelectorScreenState();
}

class _SizeSelectorScreenState extends State<SizeSelectorScreen> {
  String selectedSize = '';


  void handleSizeSelection(String size) {
    setState(() {
      selectedSize = size;
    });


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
      ),
    );
  }

  // Create a button widget
  Widget createSizeButton(String size) {
    return ElevatedButton(
      onPressed: () => handleSizeSelection(size),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedSize == size ? Colors.green : Colors.blue, // Change color if selected
        padding: EdgeInsets.all(10),
      ),
      child: Text(size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                createSizeButton('S'),
                SizedBox(width: 10),
                createSizeButton('M'),
                SizedBox(width: 10),
                createSizeButton('L'),
                SizedBox(width: 10),
                createSizeButton('XL'),
                SizedBox(width: 10),
                createSizeButton('XXL'),
                SizedBox(width: 10),
                createSizeButton('XXXL'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
