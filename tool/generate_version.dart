import 'dart:convert';
import 'dart:io';

void main() {
  final pubspec = File('pubspec.yaml').readAsStringSync();

  final version =
      RegExp(
        r'^version:\s*(.+)$',
        multiLine: true,
      ).firstMatch(pubspec)?.group(1)?.trim() ??
      'unknown';

  final output = File('build/web/version.json');
  output.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert({
      'version': version,
      'cms': 'sanity',
      'dataset': 'event-information',
      'environment': 'production',
    }),
  );

  print('Generated build/web/version.json');
}
