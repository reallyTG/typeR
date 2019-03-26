context("errcheck_tsvreq")
library(tsvr)

test_that("test the ability to catch things non-numerics, inconsistent lengths, non-finite elements",{
  expect_error(errcheck_tsvreq(ts="test",com=c(1,2,3),comnull=c(1,2,3),tsvr=c(1,2,3),wts=c(1,2,3)),
               "Error in tsvreq class: all slots must be numeric")
  expect_error(errcheck_tsvreq(ts=c(1,2,3),com=c(1,2,3),comnull=c(1,2,3),tsvr=c(1,2,3),wts=c(1,2)),
               "Error in tsvreq class: all slots must be the same length")  
  expect_error(errcheck_tsvreq(ts=c(1,2,3),com=c(1,2,3),comnull=c(1,2,3),tsvr=c(1,2,3),wts=c(1,2,NA)),
               "Error in tsvreq class: non-finite values not allowed")
})

test_that("test ability to catch negatives",{
  expect_error(errcheck_tsvreq(ts=c(1,2,3),com=c(1,2,3),comnull=c(1,2,3),tsvr=c(1,2,3),wts=c(1,2,-1)),
               "Error in tsvreq class: negative values not allowed")
})

test_that("test the ability to check for inconsistency",{
  expect_error(errcheck_tsvreq(ts=c(1,2,3),com=c(1,2,3),comnull=c(1,2,3),tsvr=c(1,1,2),wts=c(1,2,1)),
               "Error in tsvreq class: com should equal comnull times tsvr")
})
