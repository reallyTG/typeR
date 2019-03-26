test_that("polynomial evaluation is correct", {
  x <- c(1.1, 2.2)
  H <- wavefunction:::evaluate_H_at(x, degree = 4)
  expect_equal(nrow(H), 2)
  expect_equal(ncol(H), 5)
  expect_equal(H[, 1], c(1, 1), tolerance = 1e-8)
  expect_equal(H[, 2], 2.0 * x, tolerance = 1e-8)
  expect_equal(H[, 3], 4.0 * x ^ 2 - 2.0, tolerance = 1e-8)
  expect_equal(H[, 4], 8.0 * x ^ 3 - 12.0 * x, tolerance = 1e-8)
  expect_equal(H[, 5], 16.0 * x ^ 4 - 48 * x ^ 2 + 12, tolerance = 1e-8)
})

test_that("steregraphic unprojection is correct", {
  x <- wavefunction:::unproject_stereographic(tan(pi / 6))
  expect_length(x, 2)
  expect_equal(x[1], 1 - 2 * sin(pi / 3) * cos(pi / 6), tolerance = 1e-8)
  expect_equal(x[2], 2 * sin(pi / 3) * sin(pi / 6), tolerance = 1e-8)
})

test_that("N(0, 1/2) is fit correctly", {
  set.seed(17)
  x <- rnorm(10000, 0, 1 / sqrt(2))
  wf <- wavefunction_fit(x, degree = 4)
  expect_equal(wf, c(1.0, 0.0, 0.0, 0.0, 0.0), tolerance = 0.01)
})

test_that("dwavefunction works on (1, 0, 0)", {
  x <- c(-0.4, 0.3)
  wf <- structure(c(1, 0, 0), class = "wavefunction")
  expected_p <- dnorm(x, sd = sqrt(0.5))
  p <- dwavefunction(x, wf)
  expect_equal(expected_p, p, tolerance = 1e-14)
  a <- dwavefunction(x, wf, amplitude = TRUE)
  expect_equal(expected_p, a ^ 2, tolerance = 1e-14)
  lp <- dwavefunction(x, wf, log = TRUE)
  expect_equal(log(expected_p), lp, tolerance = 1e-14)
})

test_that("dwavefunction integrates to one", {
  # Check that for an arbitrary coefficient vector (other than the constraint
  # that its sum of squares is one), the integral of `dwavefunction` is one.
  wf <- c(0.1, 0.2, 0.3, 0.4)
  wf <- wf / sqrt(sum(wf ^ 2))
  expect_equal(sum(wf ^ 2), 1, tolerance = 1e-12)
  ii <- integrate(function(x) dwavefunction(x, wf), -10, 10)
  expect_equal(1.0, ii$value, tolerance = 1e-5)
})

test_that("dwavefunction detects bad coefficients", {
  wf <- c(0.1, 0.2, 0.3)  # sum of squares is not one
  expect_error(dwavefunction(0.7, wf))
})

test_that("Beta(3, 12) is fit closely", {
  # Check that `wavefunction_fit` can fit a Beta(3, 12) to within 0.03 total
  # variation distance. We transform it and scale it so that it has mean 0.0
  # and variance 0.5.
  set.seed(17)
  a <- 3
  b <- 12
  m <- a / (a + b)
  s <- sqrt(a * b / (a + b) ^ 2 / (a + b + 1)) / sqrt(2)
  x <- (rbeta(10000, a, b) - m) / s
  wf <- wavefunction_fit(x, degree = 10)
  ii <- integrate(
      function(x) abs(s * dbeta(x * s + m, a, b) - dwavefunction(x, wf)),
      -Inf, Inf)
  tv_distance <- 0.5 * ii$value
  expect_lt(0.0, tv_distance)
  expect_lt(tv_distance, 0.03)
})
