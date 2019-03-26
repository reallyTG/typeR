boolSkip=F

test_that("Check 28.1 - johnstonIndex - 3 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v1 = weightedVotingGameVector(n = 3, w = c(3,2,1), q = 4)
  result=johnstonIndex(v1)
  expect_equal(result, c(2/3, 1/6, 1/6))
})

test_that("Check 28.2 - johnstonIndex - 3 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v2 = weightedVotingGameVector(n = 3, w = c(5,3,1), q = 8)
  result=johnstonIndex(v2)
  expect_equal(result, c(1/2, 1/2, 0.0))
})

test_that("Check 28.3 - johnstonIndex - 3 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v3 = weightedVotingGameVector(n = 3, w = c(8,8,1), q = 9)
  result=johnstonIndex(v3)
  expect_equal(result, c(1/3, 1/3, 1/3))
})

test_that("Check 28.4 - johnstonIndex - 3 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v4 = weightedVotingGameVector(n = 3, w = c(7,3,3), q = 10)
  result=johnstonIndex(v4)
  expect_equal(result, c(2/3, 1/6, 1/6))
})

test_that("Check 28.5 - johnstonIndex - 3 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v5 = weightedVotingGameVector(n = 3, w = c(8,4,1), q = 10)
  result=johnstonIndex(v5)  
  expect_equal(result, c(1/2, 1/2, 0.0))
})

test_that("Check 28.6 - johnstonIndex - 4 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v6 = weightedVotingGameVector(n = 4, w = c(5,1,1,1), q = 6)
  result=johnstonIndex(v6)
  expect_equal(result, c(11/14, 1/14, 1/14, 1/14))
})

test_that("Check 28.7 - johnstonIndex - 4 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v7 = weightedVotingGameVector(n = 4, w = c(2,1,1,1), q = 5)
  result=johnstonIndex(v7)
  expect_equal(result, c(1/4, 1/4, 1/4, 1/4))
})

test_that("Check 28.8 - johnstonIndex - 4 players quota game",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v8 = weightedVotingGameVector(n = 4, w = c(7,4,3,2), q = 12)
  result=johnstonIndex(v8)
  expect_equal(result, c(1/2, 1/6, 1/6, 1/6))
})

