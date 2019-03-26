boolSkip=F

test_that("Check 03.1 - unanimityGameValue with N={1,2,3,4,5}, S={1,2,3} and T={1,2,3}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=sample(c(1,2,3),3)
  T=sample(c(1,2,3),3)
  result=unanimityGameValue(S,T)
  expect_equal(result,1)
})
test_that("Check 03.2 - unanimityGameValue with N={1,2,3,4,5}, S={1,2,3} and T={1,3}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=sample(c(1,2,3),3)
  T=sample(c(1,3),2)
  result=unanimityGameValue(S,T)
  expect_equal(result,1)
})
test_that("Check 03.3 - unanimityGameValue with N={1,2,3,4,5}, S={1,2,3} and T={1}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=sample(c(1,2,3),3)
  T=c(1)
  result=unanimityGameValue(S,T)
  expect_equal(result,1)
})
test_that("Check 03.4 - unanimityGameValue with N={1,2,3,4,5}, S={1,2,3} and T={1,2,4}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=sample(c(1,2,3),3)
  T=sample(c(1,2,4),3)
  result=unanimityGameValue(S,T)
  expect_equal(result,0)
})
test_that("Check 03.5 - unanimityGameValue with N={1,2,3,4,5}, S={1,2,3} and T={3,4,5}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=sample(c(1,2,3),3)
  T=sample(c(3,4,5),3)
  result=unanimityGameValue(S,T)
  expect_equal(result,0)
})
test_that("Check 03.6 - unanimityGameValue with N={1,2,3,4,5}, S={1,2,3} and T={4,5}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=sample(c(1,2,3),3)
  T=sample(c(4,5),2)
  result=unanimityGameValue(S,T)
  expect_equal(result,0)
})

#Only check for invalid T as specific for unanimityGameValue
test_that("Check 03.7 - unanimityGameValue parameter check with invalid T (as T NULL) and valid S={1,2,3} and valid N={1,2,3,4,5}",{
  if(boolSkip){
    skip("Test was skipped")
  }

  S=sample(c(1,2,3),3)
  T=c()
  expect_error(unanimityGameValue(S,T))
})

