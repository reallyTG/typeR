boolSkip=F

test_that("Check 06.1 - function based on the 'Majority Game with One Veto Player' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1, 2, 3)
  result=majoritySingleVetoGameValue(S = S, vetoPlayer = 1)
  expect_equal(result, 1)
})

test_that("Check 06.2 - function based on the 'Majority Game with One Veto Player' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1)
  result=majoritySingleVetoGameValue(S = S, vetoPlayer = 1)
  expect_equal(result, 0)
})

test_that("Check 06.3 - function based on the 'Majority Game with One Veto Player' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(2)
  result=majoritySingleVetoGameValue(S = S, vetoPlayer = 1)
  expect_equal(result, 0)
})

test_that("Check 06.3 - function based on the 'Majority Game with One Veto Player' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(2, 3)
  result=majoritySingleVetoGameValue(S = S, vetoPlayer = 1)
  expect_equal(result, 0)
})

test_that("Check 06.4 - function based on the 'Majority Game with One Veto Player' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1, 2)
  result=majoritySingleVetoGameValue(S = S, vetoPlayer = 1)
  expect_equal(result, 1)
})

test_that("Check 06.4 - function based on the 'Majority Game with One Veto Player' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1, 2, 4)
  result=majoritySingleVetoGameValue(S = S, vetoPlayer = 4)
  expect_equal(result, 1)
})
