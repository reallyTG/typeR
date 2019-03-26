library(kader)
context("Functions related to weights, bias and variance in E. & S. (2012)")

test_that("Dim. of return value of weights_ES2012().", {
  s <- 3L;   n <- 5L
  w <- weights_ES2012(sigma = rep(1, s), xXh = rep(1, n), thetaXh = rep(1, n),
    K = function(x) x, h = 1)
  expect_identical(dim(w), c(s, n))
  expect_identical(w, matrix(0.2, nrow = s, ncol = n))
})

test_that("Dim. and value of return value of bias_ES2012().", {
  s <- 2L;   n <- 3L
  b <- bias_ES2012(sigma = rep(1, s), h = 1, xXh = rep(1, n), thetaXh = rep(1, n),
    K = function(x) x, mmDiff = rep(1, n))
  expect_identical(length(b), s)
  expect_identical(b, rep(1, s))
})

test_that("Dim. and value of return value of var_ES2012().", {
  s <- 2L;   n <- 3L
  v <- var_ES2012(sigma = rep(1, s), h = 1, xXh = rep(1, n), thetaXh = rep(1, n),
    K = function(x) x, YmDiff2 = rep(1, n))
  expect_identical(length(v), s)
  expect_equal(v, rep(1/3, s))
})
