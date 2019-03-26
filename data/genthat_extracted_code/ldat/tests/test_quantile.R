
context("Quantile")

test_that("partial_sort works", {
  n <- 100
  pivots <- c(1, 5, 40, 50, 70, 99, 99, 100)
  
  xr <- rnorm(n)
  x <- as_lvec(xr)
  y <- partial_sort(x, pivots, clone = TRUE)
  x_sorted <- sort(x, clone = TRUE)

  # x should not be modified (clone = TRUE)
  expect_that(as_rvec(x), equals(xr))
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))
  # clone = FALSE
  tmp <- clone(x)
  y <- partial_sort(tmp, pivots, clone = FALSE)
  expect_that(as_rvec(tmp), equals(as_rvec(y)))
  # order of pivots should not matter
  y <- partial_sort(x, rev(pivots), clone = TRUE)
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))
  # error handling
  expect_error(partial_sort(x, pivots = c(-1, 10)))
  expect_error(partial_sort(x, pivots = c(1, 1000)))
  expect_error(partial_sort(x, pivots = c(1, NA)))
  # missing values
  x[c(10, 20, 30, 40, 50, 60)] <- NA
  y <- partial_sort(x, pivots, clone = TRUE)
  x_sorted <- sort(x, clone = TRUE)
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))

  # Integer
  xr <- as.integer(sample(10, n, replace = TRUE))
  x <- as_lvec(xr)
  y <- partial_sort(x, pivots, clone = TRUE)
  x_sorted <- sort(x, clone = TRUE)
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))

  # Logical
  xr <- sample(c(TRUE, FALSE, FALSE), n, replace = TRUE)
  x <- as_lvec(xr)
  y <- partial_sort(x, pivots, clone = TRUE)
  x_sorted <- sort(x, clone = TRUE)
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))

  # Character
  xr <- sample(LETTERS, n, replace = TRUE)
  x <- as_lvec(xr)
  y <- partial_sort(x, pivots, clone = TRUE)
  x_sorted <- sort(x, clone = TRUE)
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))
})

test_that("partial_order works", {
  n <- 100
  pivots <- c(1, 5, 40, 50, 70, 99, 99, 100)
  
  xr <- rnorm(n)
  x <- as_lvec(xr)
  o <- partial_order(x, pivots)
  y <- x[o]
  x_sorted <- sort(x, clone = TRUE)

  # x should not be modified (clone = TRUE)
  expect_that(as_rvec(x), equals(xr))
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))
  # order of pivots should not matter
  o <- partial_order(x, rev(pivots))
  y <- x[o]
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))
  # error handling
  expect_error(partial_order(x, pivots = c(-1, 10)))
  expect_error(partial_order(x, pivots = c(1, 1000)))
  expect_error(partial_order(x, pivots = c(1, NA)))
  # missing values
  x[c(10, 20, 30, 40, 50, 60)] <- NA
  o <- partial_order(x, pivots)
  y <- x[o]
  x_sorted <- sort(x, clone = TRUE)
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))

  # Integer
  xr <- as.integer(sample(10, n, replace = TRUE))
  x <- as_lvec(xr)
  o <- partial_order(x, pivots)
  y <- x[o]
  x_sorted <- sort(x, clone = TRUE)
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))

  # Logical
  xr <- sample(c(TRUE, FALSE, FALSE), n, replace = TRUE)
  x <- as_lvec(xr)
  o <- partial_order(x, pivots)
  y <- x[o]
  x_sorted <- sort(x, clone = TRUE)
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))

  # Character
  xr <- sample(LETTERS, n, replace = TRUE)
  x <- as_lvec(xr)
  o <- partial_order(x, pivots)
  y <- x[o]
  x_sorted <- sort(x, clone = TRUE)
  # y should equal x_sorted at pivots
  expect_that(as_rvec(y[pivots]), equals(as_rvec(x_sorted[pivots])))
})


test_that("quantile works", {
  n <- 99
  centre <- round((n+1)/2)
  x <- as_lvec(rnorm(n))
  x_sorted <- sort(x, clone = TRUE)

  expect_that(quantile(x, 0, names = FALSE), equals(min(x)))
  expect_that(quantile(x, 1, names = FALSE), equals(max(x)))
  expect_that(quantile(x, 0.5, names = FALSE), equals(as_rvec(x_sorted[centre])))
  expect_gt(length(attr(quantile(x, 0.1, true_probs = TRUE), "probs")), 0)
})

test_that("median works", {
  n <- 99
  centre <- round((n+1)/2)
  x <- as_lvec(rnorm(n))
  x_sorted <- sort(x, clone = TRUE)

  expect_that(median(x), equals(as_rvec(x_sorted[centre])))
})

