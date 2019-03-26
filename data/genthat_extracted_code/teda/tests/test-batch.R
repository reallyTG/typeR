library(teda)

test_that("Batch eccentricity is correct with 3 observations?", {
  expect_equal(teda_b(c(20, 12, 10))$eccentricity, c(0.9, 0.5, 0.6))
})

test_that("Batch typicality is correct with 3 observations?", {
  expect_equal(teda_b(c(20, 12, 10))$typicality, c(0.1, 0.5, 0.4))
})

test_that("Batch normalised eccentricity with 3 observations is correct?", {
  expect_equal(teda_b(c(20, 12, 10))$norm_eccentricity, c(0.45, 0.25, 0.3))
})

test_that("Batch normalised typicality is correct with 3 observations?", {
  expect_equal(teda_b(c(20, 12, 10))$norm_typicality, c(0.1, 0.5, 0.4))
})

test_that("Number of outliers correct?", {
  expect_equal(sum(teda_b(c(20, 12, 10))$outlier), 1)
})

test_that("Threshold correct?", {
  expect_equal(teda_b(c(20, 12, 10))$ecc_threshold, 0.333)
})
