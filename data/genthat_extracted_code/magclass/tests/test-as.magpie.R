context("Conversion Test")

test_that("conversions do not affect content", {
  data("population_magpie")
  mag <- population_magpie
  expect_identical(as.magpie(mag),mag)
  expect_identical(as.magpie(as.array(mag)),mag)
#  expect_identical(as.magpie(as.data.frame(mag)),mag)
})