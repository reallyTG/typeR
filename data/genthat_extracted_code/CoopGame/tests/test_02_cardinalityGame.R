boolSkip=F

test_that("Check 02.1 - cardinalityGameValue with S={1}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1)
  result=cardinalityGameValue(S)
  expect_equal(result,1)
})

test_that("Check 02.2 - cardinalityGameValue with S={1,2}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1,2)
  result=cardinalityGameValue(S)
  expect_equal(result,2)
})

test_that("Check 02.3 - cardinalityGameValue with S={1,..,10}",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1:10)
  result=cardinalityGameValue(S)
  expect_equal(result,10)
})
