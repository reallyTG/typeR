context("Utilities")
library(nvctr)

test_that("normalization", {
  expect_equal(unit(c(1, 0, 0)), c(1, 0, 0))

  expect_equal(unit(c(0, 0, 0)), c(1, 0, 0))
})

