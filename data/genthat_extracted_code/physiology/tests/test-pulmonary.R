context("acid base")

test_that("bad data throws errors in alveolar gas eqtn", {
  expect_error(alveolar_PAO2_mmHg(fi_o2 = -1))
  expect_error(alveolar_PAO2_mmHg(fi_o2 = 1.1))
  expect_error(alveolar_PAO2_mmHg(rq = -1))
  expect_error(alveolar_PAO2_mmHg(rq = 99))
  expect_error(alveolar_PAO2_mmHg(PACO2_mmHg = -1))
  expect_error(alveolar_PAO2_mmHg(PACO2_mmHg = 50000))
  expect_error(alveolar_PAO2_mmHg(Patm_mmHg = -1))
  expect_error(alveolar_PAO2_mmHg(Patm_mmHg = 0.1))
  expect_error(alveolar_PAO2_mmHg(PAH2O_mmHg = -1))
  expect_error(alveolar_PAO2_mmHg(PAH2O_mmHg = 1000))
})
