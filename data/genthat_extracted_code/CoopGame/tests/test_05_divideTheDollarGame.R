boolSkip=F

test_that("Check 05.1 - function based on the 'Divide the Dollar game' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1, 2, 3)
  numberOfPlayers=4
  result=divideTheDollarGameValue(S = S, n = numberOfPlayers)
  expect_equal(result, 1)
})

test_that("Check 05.2 - function based on the 'Divide the Dollar game' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1, 2, 3)
  numberOfPlayers=8
  result=divideTheDollarGameValue(S = S, n = numberOfPlayers)
  expect_equal(result, 0)
})

test_that("Check 05.3 - function based on the 'Divide the Dollar game' ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1, 2)
  numberOfPlayers=4
  result=divideTheDollarGameValue(S = S, n = numberOfPlayers)
  expect_equal(result, 1)
})
