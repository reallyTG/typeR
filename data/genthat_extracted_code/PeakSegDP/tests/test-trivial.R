library(testthat)
library(PeakSegDP)
context("trivial examples")

pseg3 <- function(...){
  y <- c(...)
  w <- rep(1, length(y))
  ## TODO: when we write a real solver it should replace cDPA, which
  ## does not pass all these tests.
  fit <- cDPA(y, rep(1, length(y)), 3)
  ends <- getPath(fit)
  e <- ends[3,]
  if(any(is.na(e))){
    stop("no feasible model with 3 segments")
  }
  e
}
  
test_that("infeasible models", {
  expect_error({
    pseg3(3, 2, 1)
  }, "no feasible model with 3 segments")
  expect_error({
    pseg3(1, 2, 3)
  }, "no feasible model with 3 segments")
})

test_that("feasible models", {
  ends <- pseg3(1, 3, 2)
  expect_equal(ends, 1:3)
  ends <- pseg3(1, 5, 2)
  expect_equal(ends, 1:3)
  ends <- pseg3(2, 3, 1)
  expect_equal(ends, 1:3)
})

test_that("solver cost same as PoissonLoss", {
  x <- c(1, 5, 2)
  fit <- cDPA(x, maxSegments=3)
  mean1.vec <- cumsum(x)/seq_along(x)
  expect_equal(fit$mean[1,], mean1.vec)
  loss1 <- PoissonLoss(x, mean1.vec[3])
  expect_equal(fit$loss[1,3], loss1)
  mean2.vec <- cumsum(x[-1])/1:2
  expect_equal(fit$mean[2,2:3], mean2.vec)
  loss2 <- PoissonLoss(x, c(1, 3.5, 3.5))
  expect_equal(fit$loss[2,3], loss2)
  expect_equal(fit$mean[3,3], 2)
  loss3 <- PoissonLoss(x, x)
  expect_equal(fit$loss[3,3], loss3)
})

test_that("no feasible model for paper data set, forward", {
  expect_error({
    pseg3(1, 10, 14, 13)
  }, "no feasible model with 3 segments")
})

test_that("sub-optimal model for paper data set, reverse", {
  count.vec <- c(13, 14, 10, 1)
  fit <- cDPA(count.vec, maxSegments=3L)
  cdpa.loss <- fit$loss[3,4]
  mean.vec <- c(11, 12, 12, 1)
  other.loss <- PoissonLoss(count.vec, mean.vec)
  expect_gt(cdpa.loss, other.loss)
})
