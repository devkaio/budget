import 'package:flutter/material.dart';
import 'package:raro_academy_budget/modules/login-page/initial_login_page.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/facebook_button_widget.dart';
import 'package:raro_academy_budget/modules/login-page/widgets/google_button_widget.dart';
import 'package:raro_academy_budget/modules/signup-page/signup_page.dart';
import 'package:raro_academy_budget/shared/widgets/input_form_widget.dart';
import 'package:raro_academy_budget/util/constants/app_text_styles.dart';
import 'package:raro_academy_budget/util/validators/text_validator.dart';

import 'next_button_widget.dart';

class SingleEmailFormWidget extends StatefulWidget {
  const SingleEmailFormWidget({Key? key}) : super(key: key);

  @override
  _SingleEmailFormWidgetState createState() => _SingleEmailFormWidgetState();
}

class _SingleEmailFormWidgetState extends State<SingleEmailFormWidget> {
  TextEditingController _inputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _enabled = false;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('inputform reiniciado');
    var _onPressed;
    if (_enabled) {
      _onPressed = () {
        _formKey.currentState!.validate();
        Navigator.pushNamed(context, SignUpPage.id);
        print('tap');
      };
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputForm(
            hintText: "Insira seu e-mail",
            labelText: "E-mail",
            controller: _inputController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  print(value);
                  _enabled = true;
                });
              } else
                setState(() {
                  print(value);
                  _enabled = false;
                });
            },
            validator: (String? value) => Validators.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
          ),
          NextButtonWidget(
            formKey: _formKey,
            onPressed: _onPressed,
          ),
          const Text(
            "ou",
            style: AppTextStyles.kSecondaryTextLoginPage,
          ),
          GoogleButtonWidget(),
          FacebookButtonWidget(),
        ],
      ),
    );
  }
}
