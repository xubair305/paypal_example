import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paypal_example/paypal_payment.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key? key}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  TextStyle style = const TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Paypal Payment Example'),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // make PayPal payment

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PaypalPayment(
                        onFinish: (number) async {
                          // payment done
                          log('order id: $number');
                        },
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Pay with Paypal',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
