boolSkip=F



test_that("Check 60.1 - gately with 3 players, return TRUE" ,{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=c(0,0,0,4,0,3,6)
  result=gatelyValue(v)
  expect_equal(result, c(18/11,36/11,12/11), tolerance=1e-3)
})
