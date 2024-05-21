import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final double height;
  final RegExp valadationRegEx;
  final bool obscureText;
  final void Function(String?) onSaved;

  const CustomFormField(
      {super.key,
      required this.hintText,
      required this.height,
      required this.valadationRegEx,
      required this.onSaved,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onSaved: onSaved,
        obscureText: obscureText,
        validator: (value) {
          if (value != null && valadationRegEx.hasMatch(value)) {
            return null;
          }
          return "Enter a valid ${hintText.toLowerCase()}";
        },
        decoration: InputDecoration(
            hintText: hintText, border: const OutlineInputBorder()),
      ),
    );
  }
}
