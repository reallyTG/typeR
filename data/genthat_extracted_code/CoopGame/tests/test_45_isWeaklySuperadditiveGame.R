boolSkip=F

test_that("Check 45.1 - isWeaklySuperadditiveGame with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1:7)
  result=isWeaklySuperadditiveGame(v)
  expect_equal(result, TRUE)
})


test_that("Check 45.2 - isWeaklySuperadditiveGame with 4 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1:15)
  result=isWeaklySuperadditiveGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 45.3 - isWeaklySuperadditiveGame with 3 players, return FALSE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(1:5,7,7)
  result=isWeaklySuperadditiveGame(v)
  expect_equal(result, FALSE)
})