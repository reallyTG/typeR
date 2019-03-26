boolSkip=F

test_that("Check 22.1 - isQuasiBalancedGame - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,60,60,60,72)
  result = isQuasiBalancedGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 22.2 - isQuasiBalancedGame - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,4,5,18,14,9,24) 
  result = isQuasiBalancedGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 22.3 - isQuasiBalancedGame - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,40,50,20,100)
  result = isQuasiBalancedGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 22.4 - isQuasiBalancedGame - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,4,5,18,20,20,24) 
  result = isQuasiBalancedGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 22.5 - isQuasiBalancedGame - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,4,5,18,20,20,18) 
  result = isQuasiBalancedGame(v)
  expect_equal(result, FALSE)
})



test_that("Check 22.6 - isQuasiBalancedGame - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,  0,  0,  0, 30, 30, 30, 30, 30, 60, 72, 72, 72, 72, 108)
  result = isQuasiBalancedGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 22.7 - isQuasiBalancedGame - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,  0,  0,  0, 30, 30, 30, 30, 30, 60, 72, 72, 72, 72, 50)
  result = isQuasiBalancedGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 22.8 - isQuasiBalancedGame - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(1,  1,  1,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)
  result = isQuasiBalancedGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 22.9 - isQuasiBalancedGame - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 12, 12, 12, 12, 22)
  result = isQuasiBalancedGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 22.10 - isQuasiBalancedGame - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 0, 1, 0, 0, 0, 0, 3, 3, 3, 3, 3, 4)
  result = isQuasiBalancedGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 22.11 - isQuasiBalancedGame - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 0, 1, 2, 1, 1, 1, 1, 4, 3, 2, 1, 7)
  result = isQuasiBalancedGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 22.12 - isQuasiBalancedGame - 4 players - example from TUGLAB",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 0, 1, 2, 1, 1, 1, 1, 4, 3, 2, 1, -2)
  result = isQuasiBalancedGame(v)
  expect_equal(result, FALSE)
})
