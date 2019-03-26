test_that("neutralitytest returns correct object", {
  expect_is(neutralitytest(VAFneutral), "neutralitytest")
})

test_that("neutrality test identifies neutral and non neutral examples", {
  expect_true(neutralitytest(VAFneutral)$rsq$pval > 0.05)
  expect_true(neutralitytest(VAFselection)$rsq$pval < 0.05)
  expect_true(neutralitytest(VAFneutral)$area$metric < neutralitytest(VAFselection)$area$metric)
  expect_true(neutralitytest(VAFneutral)$Dk$metric < neutralitytest(VAFselection)$Dk$metric)
  expect_true(neutralitytest(VAFneutral)$meanDist$metric < neutralitytest(VAFselection)$meanDist$metric)
  expect_true(neutralitytest(VAFneutral, read_depth = 100.0, cellularity = 0.8)$meanDist$metric < neutralitytest(VAFselection)$meanDist$metric)
})
