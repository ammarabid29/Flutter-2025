import 'package:flutter/material.dart';
import 'package:practice_flutter/data/notifiers.dart';
import 'package:practice_flutter/views/pages/home_page.dart';
import 'package:practice_flutter/views/pages/profile_page.dart';
import 'package:practice_flutter/views/widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Map"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (_, isDarkMode, __) {
                return Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                );
              },
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (_, selectedPage, __) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
