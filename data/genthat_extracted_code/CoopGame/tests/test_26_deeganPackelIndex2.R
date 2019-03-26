boolSkip=F

test_that("Check 26.1 - test deeganPackelIndex4Vector Holler & Illing 6.3.3 example",{
  if(boolSkip){
    skip("Test was skipped")
  }
  
  v=weightedVotingGameVector(n=5, w=c(35,20,15,15,15),q=51)
  dp=deeganPackelIndex(v)
  expect_equal(dp,c(18/60,9/60,11/60,11/60,11/60))
})

