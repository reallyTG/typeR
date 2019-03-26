library(nima)
context("Finding absolute maximums")

test_that("absmax finds the absolute maximum", {
  expect_equal(absmax(c(5, 3, -9, -100, 3.14159, 7.5)), 100)
})

test_that("absmax ignores NA values", {
  expect_equal(absmax(c(5, 3, NA, -9, NA, 200, NA), na.rm = TRUE), 200)
})
