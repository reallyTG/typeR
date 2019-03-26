context("Replace Missing Value")

test_that("Replace Missing Value",{

  X <- c(1:10)
  X[c(3,7)] <- NA
  new.rep = rep(-1,10)
  E <- c(1:10)
  E[c(3,7)] <- -1

  Y <- replace.missing(X, rep = new.rep)

  expect_length(Y, 10)
  expect_equal(Y, E)

  X <- c(1:10)
  X[c(3,7)] <- -1
  new.rep = rep(NA,10)
  E <- c(1:10)
  E[c(3,7)] <- NA

  Y <- replace.missing(X, missing = -1, rep = new.rep)

  expect_length(Y, 10)
  expect_equal(Y, E)

})
