import 'package:auth_nav/bloc/auth_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_navigation.dart';

abstract class SplashPage extends StatefulWidget {
  static const TAG = 'SplashPage';

  final InitializeApp initializeApp;

  SplashPage(this.initializeApp, {Key? key}) : super(key: key);
}

abstract class SplashPageState<W extends SplashPage> extends State<W> {
  static const TAG = 'SplashPage';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.initializeApp(context).then((state) {
      if (mounted) {
        context.read<AuthNavigationBloc>().setState(state);
      }
    });
  }
}
