boolSkip=F

test_that("Check 17.1 - isEssentialGame - 3 players - essential",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(0,0,0,60,60,60,72)
  result = isEssentialGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 17.2 - isEssentialGame - 3 players - not essential",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(30, 30, 15, 60, 60, 60, 72)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 17.3 - isEssentialGame - 3 players not essential (equality)",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(30, 30, 12, 60, 60, 60, 72)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})



test_that("Check 17.4 - isEssentialGame - 4 players - not essential",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(20, 20, 20, 40, 60, 60, 60, 60, 60, 60, 0, 0, 0, 0, 72)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 17.5 - isEssentialGame - 4 players - not essential (equality)",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(20, 20, 20, 12, 60, 60, 60, 60, 60, 60, 0, 0, 0, 0, 72)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 17.6 - isEssentialGame - 4 players - essential",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = divideTheDollarGameVector(n = 4)
  result = isEssentialGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 17.7 - isEssentialGame - 4 players - not essential",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 17.8 - isEssentialGame - 4 players - not essential (equality)",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 17.9 - isEssentialGame - 3 players not essential (equality), degenerate",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(30, 30, 12, 60, 60, 60, 72)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 17.10 - isEssentialGame - 3 players inessential, not degenerate",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(30, 30, 15, 60, 60, 60, 72)
  result = isEssentialGame(v)
  expect_equal(result, FALSE)
})

test_that("Check 17.11 - isEssentialGame - 3 players essential, not degenerate",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(0, 0, 0, 60, 60, 60, 72)
  result = isEssentialGame(v)
  expect_equal(result, TRUE)
})

test_that("Check 17.12 - isEssentialGame - 3 players essential, not degenerate compare logical type with numeric",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v = c(0, 0, 0, 60, 60, 60, 72)
  result = isEssentialGame(v)
  expect_equal(result, as.logical(1))
})
