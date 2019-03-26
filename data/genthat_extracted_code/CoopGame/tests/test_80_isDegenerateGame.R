boolSkip=F

test_that("Check 80.1 - isDegenerateGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(10,20,80,40,50,20,110)
  result=isDegenerateGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 80.2 - isDegenerateGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(10,10,80,40,50,20,100)
  result=isDegenerateGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 80.3 - isDegenerateGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=1:7
  result=isDegenerateGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 80.4 - isDegenerateGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1,2,3,5,6,7,12)
  result=isDegenerateGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 80.5 - isDegenerateGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(2,3,4,7,8,9,13)
  result=isDegenerateGame(v)
  expect_equal(result, FALSE)
})