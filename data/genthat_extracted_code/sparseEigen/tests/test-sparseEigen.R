test_that("NA check", {
  m = 10
  n = 15
  q = 3

  X <- matrix(rnorm(m*n), ncol=m)
  X_na <- X
  X_na[1, 1] <- NA
  expect_error(spEigen(X_na, q, 0.5, data=TRUE))
  expect_error(spEigen(cov(X_na), q, 0.5))
  expect_error(spEigenCov(cov(X_na), q, 0.5))
  expect_error(spEigen(X, NA, 0.5, data=TRUE))
  expect_error(spEigen(cov(X), NA, 0.5))
  expect_error(spEigenCov(cov(X), NA, 0.5))
  expect_error(spEigen(X, q, NA, data=TRUE))
  expect_error(spEigen(cov(X), q, NA))
  expect_error(spEigenCov(cov(X), q, NA))
})

test_that("positive integer q check", {
  m = 10
  n = 15
  q = 3

  X <- matrix(rnorm(m*n), ncol=m)

  expect_error(spEigen(X, -1, 0.5, data=TRUE))
  expect_error(spEigen(X, 0, 0.5, data=TRUE))
  expect_error(spEigen(X, 0.5, 0.5, data=TRUE))
  expect_error(spEigen(cov(X), -1, 0.5))
  expect_error(spEigen(cov(X), 0, 0.5))
  expect_error(spEigen(cov(X), 0.5, 0.5))
  expect_error(spEigenCov(cov(X), -1, 0.5))
  expect_error(spEigenCov(cov(X), 0, 0.5))
  expect_error(spEigenCov(cov(X), 0.5, 0.5))
})

test_that("input dimension check", {
  m = 10
  n = 15
  q = 3

  X <- matrix(rnorm(m*n), ncol=m)

  expect_error(spEigen(X[, 1], q, 0.5, data=TRUE)) # m > 1
  expect_error(spEigen(cov(X[, 1]), q, 0.5)) # m > 1
  expect_error(spEigenCov(cov(X[, 1]), q, 0.5)) # m > 1

  expect_error(spEigen(X[1, ], q, 0.5, data=TRUE)) # n > 1 (full rank)
  expect_error(spEigen(cov(X[1, ]), q, 0.5)) # n > 1 (full rank)
  expect_error(spEigenCov(cov(X[1, ]), q, 0.5)) # n > 1 (full rank)
})


test_that("output dimension check", {
  m = 10
  n = 15
  q = 3

  X <- matrix(rnorm(m*n), ncol=m)

  res <- spEigen(X, q, 0.5, data=TRUE)
  expect_equal(length(res$vectors), m*q)
  expect_equal(length(res$values), q)
  expect_equal(length(res$standard_vectors), m*q)

  res <- spEigen(cov(X), q, 0.5)
  expect_equal(length(res$vectors), m*q)
  expect_equal(length(res$values), q)
  expect_equal(length(res$standard_vectors), m*q)

  res <- spEigenCov(cov(X), q, 0.5)
  expect_equal(length(res$vectors), m*m)
  expect_equal(length(res$values), m)
  expect_equal(length(res$cov), m*m)
})

