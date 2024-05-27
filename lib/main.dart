import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      resizeToAvoidBottomInset: false,
      body: const FormValidation(),
    ),
  ));
}

class FormValidation extends StatefulWidget {
  const FormValidation({Key? key}) : super(key: key);

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();
  bool hiddenPass = true;
  bool hiddenRePass = true;
  late String _pass;

  final pass_validate = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}");
  final email_validate = RegExp(r"^[a-zA-Z0-9.]+@gmail+\.[a-zA-Z]+");
  final name_validate =
      new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  final phone_validate =
      RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$");

  bool validateName(String name) {
    String _name = name.trim();

    if (name_validate.hasMatch(_name)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePass(String pass) {
    _pass = pass.trim();

    if (pass_validate.hasMatch(_pass)) {
      return true;
    } else {
      return false;
    }
  }

  bool validateEmail(String email) {
    String _email = email.trim();
    if (email_validate.hasMatch(_email)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePhone(String phone) {
    String _phone = phone.trim();

    if (phone_validate.hasMatch(_phone)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              const Center(
                  child: Text(
                "Form Field",
                style: TextStyle(fontSize: 25.0),
              )),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  } else {
                    bool result = validateName(value);
                    if (result) {
                      return null;
                    } else {
                      return "Please enter your First Name and Last Name";
                    }
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email id.";
                  } else {
                    bool result = validateEmail(value);
                    if (result) {
                      return null;
                    } else {
                      return "Please enter proper email id";
                    }
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email id",
                  suffixText: "@gmail.com",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter phone no.";
                  } else {
                    bool result = validatePhone(value);
                    if (result) {
                      return null;
                    } else {
                      return "Please enter proper contact number";
                    }
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone No",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DOBInputField(
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                showLabel: true,
                autovalidateMode: AutovalidateMode.always,
                fieldLabelText: "Date of Birth",
                inputDecoration: const InputDecoration(
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else {
                    bool result = validatePass(value);
                    if (result) {
                      return null;
                    } else {
                      return "Password should contain: \nCapital Letter\nNumber\nSpecial letter\nmust be more than 8 characters";
                    }
                    print(value);
                  }
                },
                obscureText: hiddenPass,
                enableSuggestions: true,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: hiddenPass
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        hiddenPass = !hiddenPass;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Re-enter password.";
                  } else {
                    if (value == _pass) {
                      return null;
                    } else {
                      return "Password does not match";
                    }
                    print(value);
                  }
                },
                obscureText: hiddenRePass,
                enableSuggestions: true,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Re-enter Password",
                  suffixIcon: IconButton(
                    icon: hiddenRePass
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        hiddenRePass = !hiddenRePass;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Address";
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Address",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("DATA PROCESSING...")));
                  }
                },
                child: const Text("Submit", style: TextStyle(fontSize: 16.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
