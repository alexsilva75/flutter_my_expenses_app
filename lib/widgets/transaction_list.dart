import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');

    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ]);
            },
          )
        : ListView(
            children: <Widget>[
              ...userTransactions.map((tx) {
                return TransactionItem(
                  key: ValueKey(tx.id),
                  userTransaction: tx,
                  deleteTransaction: deleteTransaction,
                );
              }).toList(),
            ],
          );
  }
}
