boolSkip=F

test_that("Check 25.1 - getUtopiaPayoff - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,40,50,20,100)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(80,50,60) )

})

test_that("Check 25.2 - getUtopiaPayoff - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,6,5,5,10)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(5,5,4) )

})

test_that("Check 25.3 - getUtopiaPayoff - 3 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 60, 60, 60, 72)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(12,12,12) )

})

test_that("Check 25.4 - getUtopiaPayoff - 3 players - example from TUGLAB",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 9, 4, 7, 11)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(4,7,2) )

})

test_that("Check 25.5 - getUtopiaPayoff - 3 players - example from TUGLAB modified I",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 0, 0, 9, 4, 7, 11)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(4,7,2) )

})

test_that("Check 25.6 - getUtopiaPayoff - 3 players - example from TUGLAB modified II",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 1, 2, 9, 4, 7, 11)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(4,7,2) )

})

test_that("Check 25.7 - getUtopiaPayoff - 3 players - example from TUGLAB modified III",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 6, 2, 9, 4, 7, 11)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(4,7,2) )

})

test_that("Check 25.8 - getUtopiaPayoff - 3 players - example from TUGLAB modified IV",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(3, 6, 1, 9, 4, 7, 11)
  result = getUtopiaPayoff(v)
  expect_equal(result, c(4,7,2) )

})

test_that("Check 25.9 - getUtopiaPayoff - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,0,7,7,7,7,7,7,12,12,12,12,22) 
  result = getUtopiaPayoff(v)
  expect_equal(result, c(10,10,10,10) )

})

test_that("Check 25.10 - getUtopiaPayoff - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,5,2,5,7,7,7,7,7,7,12,12,12,12,22) 
  result = getUtopiaPayoff(v)
  expect_equal(result, c(10,10,10,10) )

})

test_that("Check 25.11 - getUtopiaPayoff - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,5,2,5,7,7,7,7,7,7,10,11,12,13,22) 
  result = getUtopiaPayoff(v)
  expect_equal(result, c(9,10,11,12) )

})

test_that("Check 25.12 - getUtopiaPayoff - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(2,5,2,5,7,8,7,9,7,5,10,11,12,13,22) 
  result = getUtopiaPayoff(v)
  expect_equal(result, c(9,10,11,12) )

})

test_that("Check 25.13 - getUtopiaPayoff - 4 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0,0,0,0,6,8,7,9,7,5,10,11,12,13,22) 
  result = getUtopiaPayoff(v)
  expect_equal(result, c(9,10,11,12) )

})

test_that("Check 25.14 - getUtopiaPayoff - 5 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(0, 0, 0, 0, 0, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72) 
  result = getUtopiaPayoff(v)
  expect_equal(result, c(0,0,0,0,0) )
})

test_that("Check 25.15 - getUtopiaPayoff - 5 players",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v <- c(73, 0, 72, 74, 75, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 80) 
  result = getUtopiaPayoff(v)
  expect_equal(result, c(8,8,8,8,8) )
})