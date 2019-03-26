context("Test numberimported and logical")

test_that("Logical equivalence", {
  x <- TRUE
  expect_that(x, equals(TRUE))
})

test_that("Numerical equivalence", {
  x <- 1
  expect_that(x, equals(1))
})
