// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   Future<void> _createData(String newData) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('newData', newData);
//   }

//   Future<void> _readData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String data = prefs.getString('newData') ?? 'No data';
//     print('Read Data: $data');
//   }

//   Future<void> _updateData(String updatedData) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('newData', updatedData);
//   }

//   Future<void> _deleteData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('newData');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CRUD Operations'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 _createData('New Data');
//               },
//               child: Text('Create Data'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await _readData();
//               },
//               child: Text('Read Data'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _updateData('Updated Data');
//               },
//               child: Text('Update Data'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _deleteData();
//               },
//               child: Text('Delete Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController _textController = TextEditingController();
//   String _storedText = '';

//   Future<void> _storeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('textKey', _textController.text);
//   }

//   Future<void> _readData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _storedText = prefs.getString('textKey') ?? '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Save/Read Text'),
//         backgroundColor: Colors.lightBlue, // Light blue background color
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 hintText: 'Enter text',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _storeData();
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: const Color.fromARGB(255, 156, 199, 234), // Blue button color
//               ),
//               child: Text('Save Text'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _readData();
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color.fromARGB(255, 160, 239, 158), // Blue button color
//               ),
//               child: Text('Load Stored Text'),
//             ),
//             SizedBox(height: 20),
//             Text(_storedText),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<void> _createData(String newData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('newData', newData);
  }

  Future<void> _readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('newData') ?? 'No data';
    debugPrint('Read Data: $data');  // Verwende debugPrint statt print
  }

  Future<void> _updateData(String updatedData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('newData', updatedData);
  }

  Future<void> _deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('newData');
  }

  Future<void> _pickImageAndSave() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('imagePath', pickedFile.path);
    }
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('imagePath');

    if (imagePath != null) {
      debugPrint('Loaded Image Path: $imagePath');  // Verwende debugPrint statt print
    } else {
      debugPrint('No Image Path found.');  // Verwende debugPrint statt print
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Operations with Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _createData('New Data');
              },
              child: const Text('Create Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _readData();
              },
              child: const Text('Read Data'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateData('Updated Data');
              },
              child: const Text('Update Data'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteData();
              },
              child: const Text('Delete Data'),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImageAndSave();
              },
              child: const Text('Pick Image and Save'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _loadImage();
              },
              child: const Text('Load Image Path'),
            ),
            // Hier wird das Bild aus dem Asset-Ordner angezeigt:
            Image.asset('images/1.avif'),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController _textController = TextEditingController();
//   String _storedText = '';

//   Future<void> _storeData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('textKey', _textController.text);
//   }

//   Future<void> _readData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _storedText = prefs.getString('textKey') ?? '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Save/Read Text'),
//         backgroundColor: Colors.lightBlue, // Light blue background color
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 hintText: 'Enter text',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _storeData();
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: const Color.fromARGB(255, 156, 199, 234), // Blue button color
//               ),
//               child: Text('Save Text'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _readData();
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color.fromARGB(255, 160, 239, 158), // Blue button color
//               ),
//               child: Text('Load Stored Text'),
//             ),
//             SizedBox(height: 20),
//             Text(_storedText),
//           ],
//         ),
//       ),
//     );
//   }
// }
