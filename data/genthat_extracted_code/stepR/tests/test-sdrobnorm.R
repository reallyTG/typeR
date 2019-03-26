context("sdrobnorm")

testx <- rnorm(100)
testp <- c(0.25, 0.75)
testlag <- 1
compare <- as.numeric(diff(quantile(diff(testx, lag = testlag), testp)) / diff(qnorm(testp)) / sqrt(2))

test_that("result is a single non-negative numeric", {
  ret <- sdrobnorm(testx)
  expect_true(is.numeric(ret) && length(ret) == 1 && ret >= 0)
})

test_that("result is identical to direct call of the formula", {
  expect_identical(sdrobnorm(testx), compare)
})

test_that("sdroborm works for small examples", {
  testx <- c(1, 1.23, 2.4, -1, 0, 5.4, 2.34)
  expect_equal(sdrobnorm(testx), 1.763862, tolerance = 1e-5)
  expect_equal(sdrobnorm(testx, lag = 3), 2.362737, tolerance = 1e-5)
})

test_that("warning is given for NA and result is identical", {
  expect_warning(ret <- sdrobnorm(c(testx, NA)))
  expect_identical(ret, compare)
})

test_that("warning for NA can be supressed and that this has to be a single boolean", {
  expect_identical(sdrobnorm(c(testx, NA), supressWarningNA = TRUE), compare)
  expect_error(sdrobnorm(testx, supressWarningNA = c(TRUE, FALSE)))
  expect_error(sdrobnorm(testx, supressWarningNA = 1))
})

test_that("warning is given for result NA and result is NA", {
  expect_warning(ret <- sdrobnorm(rnorm(2)))
  expect_true(is.na(ret))
})

test_that("warning for result NA can be supressed and that this has to be a single boolean", {
  expect_true(is.na(sdrobnorm(rnorm(2), supressWarningResultNA = TRUE)))
  expect_error(sdrobnorm(rnorm(2), supressWarningResultNA = c(TRUE, FALSE)))
  expect_error(sdrobnorm(rnorm(2), supressWarningResultNA = 1))
})

test_that("x has to be a numeric", {
  expect_error(sdrobnorm(NULL))
  expect_error(sdrobnorm(c(1.0, "s", 2)))
})

testx <- rnorm(100)
testp <- c(0.15, 1)
testlag <- 1
compare <- as.numeric(diff(quantile(diff(testx, lag = testlag), testp)) / diff(qnorm(testp)) / sqrt(2))

test_that("result is identical to direct call of the formula for non default p", {
  expect_identical(sdrobnorm(testx, p = testp), compare)
})

test_that("p has to be two distinct probabilities", {
  expect_error(sdrobnorm(testx, p = 0.5))
  expect_error(sdrobnorm(testx, p = c(0.1, 0.5, 0.8)))
  expect_error(sdrobnorm(testx, p = c(0, -1)))
  expect_error(sdrobnorm(testx, p = c(0, 1.2)))
  expect_error(sdrobnorm(testx, p = c(0, 's')))
  expect_error(sdrobnorm(testx, p = c(0.5, 0.5)))
})

testx <- -10:100 / 10
testp <- c(0.15, 0.35)
testlag <- 4
compare <- as.numeric(diff(quantile(diff(testx, lag = testlag), testp)) / diff(qnorm(testp)) / sqrt(2))
testlag <- 4.5

test_that("result is identical to direct call of the formula for non default lag", {
  expect_identical(sdrobnorm(testx, p = testp, lag = testlag), compare)
  expect_warning(ret <- sdrobnorm(rnorm(5), lag = testlag))
  expect_true(is.na(ret))
})

test_that("lag has to be a single positive integer", {
  expect_error(sdrobnorm(testx, p = testp, lag = "s"))
  expect_error(sdrobnorm(testx, p = testp, lag = 1:2))
  expect_error(sdrobnorm(testx, p = testp, lag = 0))
})
