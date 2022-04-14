import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedItemIndex = 0;
  final screens = [
    Center(
        child: Text(
      'Home',
      style: TextStyle(fontSize: 60),
    )),
    Center(
        child: Text(
      'Feed',
      style: TextStyle(fontSize: 60),
    )),
    Center(
        child: Text(
      'Chat',
      style: TextStyle(fontSize: 60),
    )),
    Center(
        child: Text(
      'Profile',
      style: TextStyle(fontSize: 60),
    )),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        // bottomNavigationBar: Row(children: [
        //   buildNavBarItem(Icons.home, 0, true),
        //   buildNavBarItem(Icons.card_giftcard, 1, false),
        //   buildNavBarItem(Icons.camera, 2, false),
        //   buildNavBarItem(Icons.pie_chart, 3, false),
        //   buildNavBarItem(Icons.person, 4, false)
        // ]),

        // bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: _counter,
        //     onTap: (index) {
        //       setState(() {
        //         _counter = index;
        //       });
        //     },
        //     items: const [
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.home),
        //           label: 'Home',
        //           backgroundColor: Colors.blue),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.favorite),
        //           label: 'Feed',
        //           backgroundColor: Colors.red),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.chat),
        //           label: 'Chat',
        //           backgroundColor: Colors.green),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.person),
        //           label: 'Profile',
        //           backgroundColor: Colors.blue),
        //     ]),
        // bottomNavigationBar: NavigationBarTheme(
        //   data: NavigationBarThemeData(
        //       indicatorColor: Colors.blue.shade100,
        //       labelTextStyle: MaterialStateProperty.all(
        //           const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        //   child: NavigationBar(
        //       selectedIndex: _counter,
        //       onDestinationSelected: (index) {
        //         setState(() {
        //           _counter = index;
        //         });
        //       },
        //       destinations: const [
        //         NavigationDestination(
        //             icon: Icon(Icons.email_outlined),
        //             selectedIcon: Icon(Icons.email),
        //             label: 'email'),
        //         NavigationDestination(
        //             icon: Icon(Icons.chat_bubble_outline), label: 'chat'),
        //         NavigationDestination(
        //             icon: Icon(Icons.camera_alt_outlined), label: 'Upload'),
        //       ]),
        // ),
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
            currentIndex: _counter,
            onTap: (index) {
              setState(() {
                _counter = index;
              });
            },
            items: [
              DotNavigationBarItem(
                icon: Icon(Icons.home),
                selectedColor: Colors.purple,
              ),

              /// Likes
              DotNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                selectedColor: Colors.pink,
              ),

              /// Search
              DotNavigationBarItem(
                icon: Icon(Icons.search),
                selectedColor: Colors.orange,
              ),

              /// Profile
              DotNavigationBarItem(
                icon: Icon(Icons.person),
                selectedColor: Colors.teal,
              ),
            ]),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: IndexedStack(
          children: screens,
          index: _counter,
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Expanded buildNavBarItem(IconData icon, int index, bool isActive) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 60,
        child: Container(
            decoration: BoxDecoration(
                color:
                    index == _selectedItemIndex ? Colors.green : Colors.white),
            child: Icon(icon)),
      ),
    );
  }
}
