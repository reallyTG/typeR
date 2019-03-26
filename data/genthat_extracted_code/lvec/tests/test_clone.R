context("Cloning")

test_that("numeric vectors are correctly cloned", {
  a_r <- c(-1.2, 5E10, NA, NaN, 4.1)
  a   <- as_lvec(a_r)
  b <- clone(a)
  b_r <- a_r
  expect_that(as_rvec(b), equals(b_r))
  lset(b, 1, 10)
  b_r[1] <- 10
  expect_that(as_rvec(b), equals(b_r))

  # empty vectors
  a_r <- numeric(0)
  a   <- as_lvec(a_r)
  b <- clone(a)
  expect_that(as_rvec(b), equals(a_r))
})

test_that("integer vectors are correctly cloned", {
  a_r <- as.integer(c(-1, 2, 1E9, NA, 1234))
  a   <- as_lvec(a_r)
  b <- clone(a)
  b_r <- a_r
  expect_that(as_rvec(b), equals(b_r))
  lset(b, 1, 10)
  b_r[1] <- 10L
  expect_that(as_rvec(b), equals(b_r))

  # empty vectors
  a_r <- integer(0)
  a   <- as_lvec(a_r)
  b <- clone(a)
  expect_that(as_rvec(b), equals(a_r))
})

test_that("logical vectors are correctly cloned", {
  a_r <- as.logical(c(TRUE, FALSE, TRUE, NA, NA))
  a   <- as_lvec(a_r)
  b <- clone(a)
  b_r <- a_r
  expect_that(as_rvec(b), equals(b_r))
  lset(b, 1, FALSE)
  b_r[1] <- FALSE
  expect_that(as_rvec(b), equals(b_r))

  # empty vectors
  a_r <- integer(0)
  a   <- as_lvec(a_r)
  b <- clone(a)
  expect_that(as_rvec(b), equals(a_r))
})

test_that("character vectors are correctly cloned", {
  a_r <- c("jan", "pier", NA, "corneel")
  a   <- as_lvec(a_r)
  b <- clone(a)
  b_r <- a_r
  expect_that(as_rvec(b), equals(b_r))
  lset(b, 1, "johan")
  b_r[1] <- "johan"
  expect_that(as_rvec(b), equals(b_r))

  # empty vectors
  a_r <- character(0)
  a   <- as_lvec(a_r)
  b <- clone(a)
  expect_that(as_rvec(b), equals(a_r))
})

