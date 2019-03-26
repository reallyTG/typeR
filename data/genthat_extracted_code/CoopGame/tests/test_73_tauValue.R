boolSkip=F



test_that("Check 73.1 - tau value with 3 players, return 1.250   1.875   1.875" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,0,0,2,2,3,5)
  expected_result=(5/8)*c(2,3,3) #1.250   1.875   1.875
  result=tauValue(v)
  expect_equal(result, expected_result,tolerance=1e-3)
})

test_that("Check 73.2 - tau value with 3 players, return NULL" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=1:7
  expected_result=NULL
  result=tauValue(v)
  expect_equal(result, expected_result,tolerance=1e-3)
})

test_that("Check 73.3 - tau value with 5 players, return c(7.391304, 14.782609, 18.478261, 27.173913, 32.173913" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,0,0,5,10,0,5,15,20,15,25,30,30,35,45,25,35,40,40,45,55,50,55,65,70,60,65,75,80,90,100)
  expected_result=c(7.391304, 14.782609, 18.478261, 27.173913, 32.173913)
  result=tauValue(v)
  expect_equal(result, expected_result,tolerance=1e-3)
})