context("errcheck_stdat")

test_that("tests of errcheck_stdat",{
  times<-1:10
  dat<-"nonnumeric"
  callfunc<-"notrealfunc"
  expect_error(errcheck_stdat(times,dat,callfunc),
               "Error in errcheck_stdat called by notrealfunc: dat must be numeric")
  
  dat<-1
  expect_error(errcheck_stdat(times,dat,callfunc),
               "Error in errcheck_stdat called by notrealfunc: dat must be a matrix")
  
  dat<-matrix(c(1,2,3),1,3)
  expect_error(errcheck_stdat(times,dat,callfunc),
               "Error in errcheck_stdat called by notrealfunc: dat must have at least two rows")
  
  dat<-matrix(1,3,9)
  expect_error(errcheck_stdat(times,dat,callfunc),
               "Error in errcheck_stdat called by notrealfunc: second dimension of dat must equal length of times")
  
  dat<-matrix(1,3,10)
  dat[1,1]<-NaN
  expect_error(errcheck_stdat(times,dat,callfunc),
               "Error in errcheck_stdat called by notrealfunc: dat must not contain NAs, NaNs, Infs")
})

