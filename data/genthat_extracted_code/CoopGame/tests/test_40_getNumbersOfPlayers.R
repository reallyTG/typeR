boolSkip=F

test_that("Check 40.1 - getNumberOfPlayers - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  A <- c(0,0,0,60,60,60,72)
  result = getNumberOfPlayers(A)
  expect_equal(result, 3)
})

test_that("Check 40.2 - getNumberOfPlayers - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  A <- c(1:15)
  result = getNumberOfPlayers(A)
  expect_equal(result, 4)
})

test_that("Check 40.3 - getNumberOfPlayers - 5 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  A <- 1:31
  result = getNumberOfPlayers(A)
  expect_equal(result, 5)
})
