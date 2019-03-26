boolSkip=F

test_that("Check 81.1 - isMonotonicGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(10,20,80,40,50,20,110)
  result=isMonotonicGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 81.2 - isMonotonicGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(10,10,10,40,50,70,100)
  result=isMonotonicGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 81.3 - isMonotonicGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=1:7
  result=isMonotonicGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 81.4 - isMonotonicGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(5,2,3,5,6,7,12)
  result=isMonotonicGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 81.5 - isMonotonicGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(5.1,2,3,5,6,7,12)
  result=isMonotonicGame(v)
  expect_equal(result, FALSE)
})