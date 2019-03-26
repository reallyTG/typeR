context("errcheck_tts")

test_that("tests for errcheck_tts that pertain to the timescales input", {
  times<-1:10
  timescales<-"numnumeric"
  values<-matrix(1,length(times),length(timescales))
  expect_error(errcheck_tts(times,timescales,values,"notrealfunc"),
               "Error in errcheck_tts called by notrealfunc: timescales must be numeric")

  timescales<-1
  expect_error(errcheck_tts(times,timescales,values,"notrealfunc"),
               "Error in errcheck_tts called by notrealfunc: timescales must be a vector")
  
  timescales<-c(1,2,3,4,Inf)
  expect_error(errcheck_tts(times,timescales,values,"notrealfunc"),
               "Error in errcheck_tts called by notrealfunc: timescales must not contain NAs, NaNs, Infs")
  
  timescales<-c(-3,-2,-1)
  expect_error(errcheck_tts(times,timescales,values,"notrealfunc"),
               "Error in errcheck_tts called by notrealfunc: timescales must be positive")
  
  #insert test for increasing/decreasing later
})

test_that("tests for errcheck_tts that pertain to the values input", {
  times<-1:10
  timescales<-1/c(1:10)
  values<-matrix("test",length(times),length(timescales))
  callfunc<-"notrealfunc"
  expect_error(errcheck_tts(times,timescales,values,callfunc),
               "Error in errcheck_tts called by notrealfunc: values must be numeric or complex")
  
  values<-1
  expect_error(errcheck_tts(times,timescales,values,callfunc),
               "Error in errcheck_tts called by notrealfunc: values must be a matrix")
  
  values<-matrix(2,5,5)
  expect_error(errcheck_tts(times,timescales,values,callfunc),
               "Error in errcheck_tts called by notrealfunc: dimensions of values should agree with lengths of times and timescales")
})