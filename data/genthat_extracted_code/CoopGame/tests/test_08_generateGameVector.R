boolSkip=F

test_that("Check 08.2 - generate game vector for majoritySingleVetoGameVector with N = {1,2,3} and veto player = 2" ,{
  if(boolSkip){
    skip("Test was skipped")
  }

  result=majoritySingleVetoGameVector(n = 3, vetoPlayer = 2)
  expect_equal(result, c(0,0,0,1,0,1,1))
})

test_that("Check 08.3 - generate game vector for divideTheDollarGameVector with N = {1,2,3,4}" ,{
  if(boolSkip){
    skip("Test was skipped")
  }

  result=divideTheDollarGameVector(n = 4)
  expect_equal(result, c(0,0,0,0,1,1,1,1,1,1,1,1,1,1,1))
})

test_that("Check 08.4 - generate game vector for divideTheDollarGameVector with N = {1,2,3}" ,{
  if(boolSkip){
    skip("Test was skipped")
  }

  result=divideTheDollarGameVector(n =3)
  expect_equal(result, c(0,0,0,1,1,1,1))
})

test_that("Check 08.5 - generate game vector for gloveGameVector with N = 4" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  L=c(1,3,4)
  R=c(2)
  result=gloveGameVector(n = 4, L, R)
  expect_equal(result, c(0,0,0, 0,1,0, 0,1,1, 0,1,1, 0,1,1))
})
