import 'package:flutter/material.dart';

import 'hotspot_target.dart';

extension WithHotspotX on Widget {
  /// Wrap this widget with a branded [HotspotTarget]
  Widget withHotspot({
    String flow = 'main',
    required num order,
    String? title,
    required String text,
    Widget? icon,
    Size? hotspotSize,
    Offset hotspotOffset = Offset.zero,
  }) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return HotspotTarget(
          flow: flow,
          hotspotSize: hotspotSize,
          hotspotOffset: hotspotOffset,
          calloutBody: Row(
            children: [
              if (icon != null) ...[
                IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: icon,
                ),
                SizedBox(width: 16),
              ],
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (title != null && title.isNotEmpty)
                      Text(
                        title,
                        style: theme.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    if (title != null && title.isNotEmpty && text.isNotEmpty)
                      SizedBox(
                        height: 12,
                      ),
                    if (text.isNotEmpty)
                      Text(
                        text,
                        style: theme.textTheme.bodyMedium,
                      ),
                  ],
                ),
              ),
            ],
          ),
          order: order,
          child: this,
        );
      },
    );
  }
}
