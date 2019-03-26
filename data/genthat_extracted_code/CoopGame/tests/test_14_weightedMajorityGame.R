boolSkip=F

test_that("Check 14.1 - weightedMajorityGameValue ",{
  if(boolSkip){
    skip("Test was skipped")
  }
   S=c(1,2)
   w=c(1,2,2)
   q = 4
  result=weightedVotingGameValue(S, w, q)
  expect_equal(result,0)
})



test_that("Check 14.2 - weightedMajorityGameValue ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1,2)
  w=c(1:5)
  q = 4
  result=weightedVotingGameValue(S, w, q)
  expect_equal(result,0)
})

test_that("Check 14.3 - weightedMajorityGameValue ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  S=c(1,2)
  w=c(1:5)
  q = 4
  result=weightedVotingGameValue(S, w, q)
  expect_equal(result,0)
})
