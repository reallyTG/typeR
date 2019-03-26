library(PCRedux)

context("head2tailratio")

test_that("head2tailratio gives the correct dimensions and properties", {
  library(qpcR)
  res <- head2tailratio(y = competimer[, 2], normalize = FALSE, slope_normalizer = TRUE)
  res_normalized <- head2tailratio(y = competimer[, 2], normalize = TRUE, slope_normalizer = TRUE)

  expect_that(res, is_a("numeric"))
  expect_that(res_normalized, is_a("numeric"))
  expect_that(res <= 3.589284, is_true())
  expect_that(res_normalized >= 23, is_true())
})
