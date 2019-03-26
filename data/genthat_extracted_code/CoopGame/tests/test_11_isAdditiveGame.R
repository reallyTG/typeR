boolSkip=F

test_that("Check 11.1 - isAdditiveGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,2,2,2,3)
  result=isAdditiveGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 11.2 - isAdditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,2,2,2,0)
  result=isAdditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 11.3 - isAdditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,2,0,2,3)
  result=isAdditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 11.4 - isAdditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,1,1,2,2,2,3)
  result=isAdditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 11.5 - isAdditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,1,1,2,2,2,-3)
  result=isAdditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 11.6 - isAdditiveGame with 4 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,1, 2,2,2,2,2,2, 3,3,3,3, 4)
  result=isAdditiveGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 11.7 - isAdditiveGame with 4 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,1, 2,2,2,2,2,2, 3,3,0,3, 4)
  result=isAdditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 11.8 - isAdditiveGame with 5 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,1,1, 2,2,2,2,2,2,2,2,2,2, 3,3,3,3,3,3,3,3,3,3, 4,4,4,4,4, 5)
  result=isAdditiveGame(v)
  expect_equal(result, TRUE)
})
