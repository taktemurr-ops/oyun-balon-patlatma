import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_balon_patlatma/oyun_balon_patlatma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(balonConfig.title.length, 33);
    expect(balonConfig.tagline.length, 33);
    for (final s in balonConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(balonRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: balonId, optionalMechanics: balonRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(balonRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
