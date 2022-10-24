import 'package:flutter/material.dart';
import 'package:spending_management/models/spending.dart';
import 'package:spending_management/page/main/analytic/widget/box_text.dart';

class TotalReport extends StatelessWidget {
  const TotalReport({Key? key, required this.list}) : super(key: key);
  final List<Spending> list;

  @override
  Widget build(BuildContext context) {
    List<Spending> spendingList =
        list.where((element) => element.money < 0).toList();

    int spending = spendingList.isEmpty
        ? 0
        : spendingList
            .map((e) => e.money)
            .reduce((value, element) => value + element);

    spendingList = list.where((element) => element.money > 0).toList();

    int income = spendingList.isEmpty
        ? 0
        : spendingList
            .map((e) => e.money)
            .reduce((value, element) => value + element);

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: boxText(
                text: "Chi tiêu: ",
                number: spending,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: boxText(
                text: "Thu nhập: ",
                number: income,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        boxText(
          text: "Thu chi:",
          number: income + spending,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: boxText(
                text: 'Số tiền: ',
                number: 1234,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: boxText(
                text: 'Số dư: ',
                number: 1234,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
