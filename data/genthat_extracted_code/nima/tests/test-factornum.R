library(nima)
context("factornum turns factors with numeric levels to numerics as expected")

test_that("factornum turns a factor with numeric levels into numeric vector", {
  expect_equal(
    factornum(factor(c(3, 4, 9, 4, 9), levels = c(3, 4, 9))),
    c(3, 4, 9, 4, 9)
  )
})
