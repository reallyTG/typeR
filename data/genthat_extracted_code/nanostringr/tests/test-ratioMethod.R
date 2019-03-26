context("refMethod")

set.seed(12)
A <- matrix(rnorm(120), ncol = 10)
B <- matrix(rnorm(80), ncol = 10)
C <- matrix(rnorm(50), ncol = 10)
D <- matrix(rnorm(40), ncol = 8)
E <- matrix(rnorm(80), ncol = 8)

test_that("Error if not all datasets have same number of columns", {
  expect_error(refMethod(A, D, E))
  expect_error(refMethod(A, B, E))
})

test_that("Error if NA in any arguments", {
  expect_error(refMethod(NA, B, C))
  expect_error(refMethod(A, NA, C))
  expect_error(refMethod(A, B, NA))
})

test_that("Always returns a matrix", {
  expect_is(refMethod(A, B, C), "matrix")
})

test_that("Adjusted data same dimension as original data", {
  expect_equal(dim(refMethod(A, B, C)), dim(A))
})
