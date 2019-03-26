boolSkip=F

test_that("Check 09.1 - gloveGameValue with S={1,2}, L={1,2}, R={3}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1,2)
  L=c(1,2)
  R=c(3)
  result=gloveGameValue(S, L, R)
  expect_equal(result, 0)
})

test_that("Check 09.2 - gloveGameValue with S={3}, L={1,2}, R={3}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(3)
  L=c(1,2)
  R=c(3)
  result=gloveGameValue(S, L, R)
  expect_equal(result, 0)
})

test_that("Check 09.3 - gloveGameValue with S={2,3}, L={1,2}, R={3}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(2,3)
  L=c(1,2)
  R=c(3)
  result=gloveGameValue(S, L, R)
  expect_equal(result, 1)
})

test_that("Check 09.4 - gloveGameValue with S={7,8}, L={1,2,5,6,8}, R={3,4,7,9,10}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(7,8)
  L=c(1,2,5,6,8)
  R=c(3,4,7,9,10)
  result=gloveGameValue(S, L, R)
  expect_equal(result, 1)
})

test_that("Check 09.5 - gloveGameValue with S={1,2,7,8,3,10}, L={1,2,5,6,8}, R={3,4,7,9,10}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  #unsorted!
  S=c(1,2,7,8,3,10)
  L=c(1,2,5,6,8)
  R=c(3,4,7,9,10)
  result=gloveGameValue(S, L, R)
  expect_equal(result, 3)
})
