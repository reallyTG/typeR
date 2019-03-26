boolSkip=F

test_that("Check 18.1 - isSuperadditiveGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,2,2,2,3)
  result=isSuperadditiveGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 18.2 - isSuperadditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,2,2,2,0)
  result=isSuperadditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 18.3 - isSuperadditiveGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,1,0,2,0,2,3)
  result=isSuperadditiveGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 18.4 - isSuperadditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,1,1,2,2,2,3)
  result=isSuperadditiveGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 18.5 - isSuperadditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,1,1,2,2,2,-3)
  result=isSuperadditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 18.6 - isSuperadditiveGame with 4 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,1, 2,2,2,2,2,2, 3,3,3,3, 4)
  result=isSuperadditiveGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 18.7 - isSuperadditiveGame with 4 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,0,0,0, 2,2,2,2,2,2, 3,3,0,3, 4)
  result=isSuperadditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 18.8 - isSuperadditiveGame with 4 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,1,0,0, 2,2,2,2,2,2, 3,3,0,3, 4)
  result=isSuperadditiveGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 18.9 - isSuperadditiveGame with 5 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,1,1,1,1, 2,2,2,2,2,2,2,2,2,2, 3,3,3,3,3,3,3,3,3,3, 4,4,4,4,4, 5)
  result=isSuperadditiveGame(v)
  expect_equal(result, TRUE)
})
