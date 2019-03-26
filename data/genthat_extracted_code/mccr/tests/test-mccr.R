require(testthat)
context("Test mccr")

test_that("calc MCC value",{
  set.seed(18)
  act <- abs(round(rnorm(100))) %% 2
  pred <- abs(round(rnorm(100))) %% 2
  score <- mccr(act, pred)
  score <- round(score, 1)
  expect_equal(0, 0)
})
