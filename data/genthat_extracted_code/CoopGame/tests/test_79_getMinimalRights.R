boolSkip=F

test_that("Check 79.1 - getMinimalRights - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,40,50,20,100)
  result = getMinimalRights(v)

  expect_equal(result, c(0,0,0))
})

test_that("Check 79.2 - getMinimalRights - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,6,5,5,10)
  result = getMinimalRights(v)

  expect_equal(result, c(1,1,0))
})

test_that("Check 79.3 - getMinimalRights - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 60, 60, 60, 72)
  result = getMinimalRights(v)

  expect_equal(result, c(48,48,48))
})

test_that("Check 79.4 - getMinimalRights - 3 players - example from TUGLAB",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 9, 4, 7, 11)
  result = getMinimalRights(v)

  expect_equal(result, c(2,5,0))
})

test_that("Check 79.5 - getMinimalRights - 3 players - example from TUGLAB modified I",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 0, 0, 9, 4, 7, 11)
  result = getMinimalRights(v)

  expect_equal(result, c(3,5,0))
})

test_that("Check 79.6 - getMinimalRights - 3 players - example from TUGLAB modified II",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 1, 2, 9, 4, 7, 11)
  result = getMinimalRights(v)

  expect_equal(result, c(3,5,2))
})

test_that("Check 79.7 - getMinimalRights - 3 players - example from TUGLAB modified III",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 6, 2, 9, 4, 7, 11)
  result = getMinimalRights(v)

  expect_equal(result, c(3,6,2))
})

test_that("Check 79.8 - getMinimalRights - 3 players - example from TUGLAB modified IV",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 6, 1, 9, 4, 7, 11)
  result = getMinimalRights(v)

  expect_equal(result, c(3,6,1))
})

test_that("Check 79.9 - getMinimalRights - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,0,7,7,7,7,7,7,12,12,12,12,22) 
  result = getMinimalRights(v)
  expect_equal(result, c(0,0,0,0))
})

test_that("Check 79.10 - getMinimalRights - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,5,2,5,7,7,7,7,7,7,12,12,12,12,22) 
  result = getMinimalRights(v)
  expect_equal(result, c(2,5,2,5))
})

test_that("Check 79.11 - getMinimalRights - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,5,2,5,7,7,7,7,7,7,10,11,12,13,22) 
  result = getMinimalRights(v)

  expect_equal(result, c(2,5,2,5))
})

test_that("Check 79.12 - getMinimalRights - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,5,2,5,7,8,7,9,7,5,10,11,12,13,22) 
  result = getMinimalRights(v)
  expect_equal(result, c(2,5,2,5))
})

test_that("Check 79.13 - getMinimalRights - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,0,6,8,7,9,7,5,10,11,12,13,22) 
  result = getMinimalRights(v)
  expect_equal(result, c(0,0,0,0))
})

test_that("Check 79.14 - getMinimalRights - 5 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 0, 0, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72) 
  result = getMinimalRights(v)
  expect_equal(result, c(72,72,72,72,72))
})

test_that("Check 79.15 - getMinimalRights - 5 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(73, 0, 72, 74, 75, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 80) 
  result = getMinimalRights(v)
  expect_equal(result, c(73,56,72,74,75))
})