library(nima)
context("Finding the number of unique elements")

test_that("uniqlen finds the number of unique elements", {
  expect_equal(uniqlen(c(1, 3, 1, 2, 2, 3, 4)), 4)
})

test_that("uniqlen ignores NA values when present by default", {
  expect_equal(uniqlen(c(1, 3, NA, 3, 1, NA, 2)), 3)
})

test_that("uniqlen does not ignore NA values when present if forced", {
  expect_equal(uniqlen(c(1, 3, NA, 3, 1, NA, 2), na.rm = FALSE), 4)
})
