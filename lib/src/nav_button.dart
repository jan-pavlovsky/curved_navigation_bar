import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final double height;

  NavButton(
      {this.onTap,
      this.position,
      this.length,
      this.index,
      this.child,
      this.height});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap(index);
        },
        child: Container(
            height: height - 12,
            child: Transform.translate(
              offset: Offset(
                  0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: child),
            )),
      ),
    );
  }
}
