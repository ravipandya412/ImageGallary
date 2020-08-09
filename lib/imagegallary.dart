import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class ImageGallary extends StatefulWidget {
  @override
  _ImageGallaryState createState() => _ImageGallaryState();
}

class _ImageGallaryState extends State<ImageGallary> {
  var image;
  List imageArray = [];

  _openCamera() async {
    // ignore: deprecated_member_use_from_same_package®
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    imageArray.add(image);
    setState(() {
      imageArray;
    });
  }

    _openGallary() async {
    // ignore: deprecated_member_use_from_same_package
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    imageArray.add(image);
    setState(() {
      imageArray;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image GridView"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                  child: FlatButton(
                      onPressed: () {
                        _openCamera();
                      },
                      splashColor: Colors.blueAccent,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Center(
                        child: Text("Open Camera"),
                      ))),
            ),
             Container(
              child: Center(
                  child: FlatButton(
                      onPressed: () {
                        _openGallary();
                      },
                      splashColor: Colors.blueAccent,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Center(
                        child: Text("Open Gallary"),
                      ))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: imageArray.isEmpty
                  ? Center(child: Text("No Image"))
                  : GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(imageArray.length, (index) {
                        var img = imageArray[index];
                        return Image.file(img);
                      }),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
