context("errcheck_data")

test_that("test that it catches bad entries",{
  calledby<-"test"
  X<-matrix(c(1,2,-1,3),2,2)
  expect_error(errcheck_data(X,calledby),
               paste0("Error in ",calledby,": data must consist of non-negative numbers, no NAs"))
  
  X<-matrix(c(NA,1,2,3),2,2)
  expect_error(errcheck_data(X,calledby),
            paste0("Error in ",calledby,": data must consist of non-negative numbers, no NAs"))  
})

test_that("test that it catches species that are all 0s or all constant",{
  calledby<-"test"
  X<-matrix(c(0,2,0,3),2,2)
  expect_error(errcheck_data(X,calledby),
               paste0("Error in ",calledby,": data should not contain species that are always 0"))

  X<-matrix(c(1,2,1,3),2,2)
  expect_error(errcheck_data(X,calledby),
               paste0("Error in ",calledby,": data should not contain species with constant abundance/density"))
                            
})
