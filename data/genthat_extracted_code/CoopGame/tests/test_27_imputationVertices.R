boolSkip=F

test_that("Check 27.1 - imputationsetVertices - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2, 4, 5, 18, 24, 9, 24)
  V1 <- c(15, 4, 5)
  V2 <- c(2, 17, 5)
  V3 <- c(2, 4, 18)
  result = imputationsetVertices(v)
  expect_equal(result[1,], V1)
  expect_equal(result[2,], V2)
  expect_equal(result[3,], V3)
})

test_that("Check 27.2 - imputationsetVertices - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 40, 50, 20, 100) 
  V3 <- c(100, 0, 0)
  V2 <- c(0, 100, 0)
  V1 <- c(0, 0, 100)
  result = imputationsetVertices(v)
  expect_equal(result[1,], V1)
  expect_equal(result[2,], V2)
  expect_equal(result[3,], V3)
})

test_that("Check 27.3 - imputationsetVertices - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 12, 12, 12, 12, 22)
  V1 <- c(22, 0, 0, 0)
  V2 <- c(0, 22, 0, 0)
  V3 <- c(0, 0, 22, 0)
  V4 <- c(0, 0, 0, 22)
  result = imputationsetVertices(v)
  expect_equal(result[1,], V4)
  expect_equal(result[2,], V3)
  expect_equal(result[3,], V2)
  expect_equal(result[4,], V1)
})

test_that("Check 27.4 - imputationsetVertices - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(1, 2, 3, 4, 5, 3, 6, 7, 7, 8, 10, 16, 32, 12, 66)
  V1 <- c(57, 2, 3, 4)
  V2 <- c(1, 58, 3, 4)
  V3 <- c(1, 2, 59, 4)
  V4 <- c(1, 2, 3, 60)
  result = imputationsetVertices(v)
  expect_equal(result[1,], V1)
  expect_equal(result[2,], V3)
  expect_equal(result[3,], V2)
  expect_equal(result[4,], V4)
})

test_that("Check 27.5 - imputationsetVertices - 5 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- weightedVotingGameVector(n = 5, w = c(4,2,2,1,1), q = 6)
  V5 <- c(1, 0, 0, 0, 0)
  V4 <- c(0, 1, 0, 0, 0)
  V3 <- c(0, 0, 1, 0, 0)
  V2 <- c(0, 0, 0, 1, 0)
  V1 <- c(0, 0, 0, 0, 1)
  result = imputationsetVertices(v)
  expect_equal(result[1,], V1)
  expect_equal(result[2,], V2)
  expect_equal(result[3,], V3)
  expect_equal(result[4,], V4)
  expect_equal(result[5,], V5)
})