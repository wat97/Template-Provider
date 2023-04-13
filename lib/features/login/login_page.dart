import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:simpananku/resources/resources.dart';

import 'login_provider.dart';
import '../../widget/widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginProvider>(context, listen: false).onInit(
        context,
        tag: runtimeType.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoginProvider>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              contentPage(context, prov),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentPage(BuildContext context, LoginProvider prov) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            margin: EdgeInsets.only(
              bottom: prov.size.height * 0.05,
            ),
            child: const Center(
              child: Text(
                "SIMPANANKU",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Container(
            height: prov.size.height * 0.25,
            width: prov.size.width * 0.9,
            padding: EdgeInsets.symmetric(
              horizontal: prov.size.width * 0.05,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: Colors.grey.withAlpha(75),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputTextNormal(
                  "Username",
                  prov.controllerUsername,
                  TextInputType.name,
                  label: "Username",
                  floatingText: false,
                ),
                SizedBox(
                  height: prov.size.height * 0.02,
                ),
                InputText(
                  "Password",
                  prov.controllerPassword,
                  TextInputType.visiblePassword,
                  isSecure: true,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: BasicButton(
              title: "Login",
              height: prov.size.height * 0.1,
              width: prov.size.width * 0.9,
              onPressed: () => prov.goLogin(),
            ),
          ),
          // GestureDetector(
          //   onTap: () => prov.goLogin(),
          //   child: Container(
          //     height: prov.size.height * 0.1,
          //     width: prov.size.width * 0.9,
          //     padding: EdgeInsets.symmetric(
          //       horizontal: prov.size.width * 0.05,
          //     ),
          //     margin: EdgeInsets.only(
          //       bottom: prov.size.width * 0.05,
          //     ),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(
          //         10,
          //       ),
          //       color: MyColors.colorPrimary,
          //     ),
          //     child: const Center(
          //       child: Text(
          //         "LOGIN",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w700,
          //           color: Colors.white,
          //           letterSpacing: 2,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
