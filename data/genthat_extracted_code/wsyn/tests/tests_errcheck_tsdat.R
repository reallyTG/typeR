context("errcheck_tsdat")

test_that("tests for errcheck_tsdat",{
  times<-1:10
  t.series<-"test"
  callfunc<-"notrealfunc"
  expect_error(errcheck_tsdat(times,t.series,callfunc),
               "Error in errcheck_tsdat called by notrealfunc: t.series not numeric")
  
  t.series<-matrix(2,2,10)
  expect_error(errcheck_tsdat(times,t.series,callfunc),
               "Error in errcheck_tsdat called by notrealfunc: t.series can either be a vector or matrix with one row")
  
  t.series<-c(1,2)
  expect_error(errcheck_tsdat(times,t.series,callfunc),
               "Error in errcheck_tsdat called by notrealfunc: times and t.series must be the same length")

  t.series<-c(1:9,Inf)
  expect_error(errcheck_tsdat(times,t.series,callfunc),
               "Error in errcheck_times called by notrealfunc: t.series must not contain NAs, NaNs, Infs")
  
  t.series<-1:10
  expect_error(errcheck_tsdat(times,t.series,callfunc),
               "Error in errcheck_tsdat called by notrealfunc: t.series must have zero mean")
})