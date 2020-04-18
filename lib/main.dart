

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: PhotosList());

}

class PhotosList extends StatefulWidget {
  @override
  _PhotosListState createState() => _PhotosListState();

}

class _PhotosListState extends State<PhotosList> {

  var gallery = new List<FileImage>();

  @override
  Widget build(BuildContext context) {


    Future getImageFromGallery() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
         gallery.add(FileImage(image));
      });

    }

    final title = 'Gallery';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          title: Text('Gallery'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_a_photo,
                color: Colors.white,
              ),
              onPressed: () {
                getImageFromGallery();
              },
            )
          ],
        ),
        body: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: gallery.length,
          itemBuilder: (BuildContext context, int index) {
            final photo = gallery[index];
            return _photoCard(photo);
          },
        ),
        backgroundColor: Colors.white70,
      ),
    );
  }

  Widget _photoCard(photo) {
    return new Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        image: DecorationImage(image: photo, fit: BoxFit.fill),

        borderRadius: BorderRadius.circular(15),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 2.0, spreadRadius: 2.0),
        ],
      ),
    );
  }

}


