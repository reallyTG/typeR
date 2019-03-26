boolSkip=F


test_that("Check 12.1 - test publicGoodIndex on example Holler Illing chapter 6.3.4 ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  w=c(35,20,15,15,15)
  q=51
  v=weightedVotingGameVector(n=5,w,q)
  pgi=publicGoodIndex(v)
  
  expect_equal(pgi,c(16/60,8/60,12/60,12/60,12/60))
})

test_that("Check 12.2 - test publicGoodIndex on example Holler Illing chapter 6.3.4 ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  w=c(35,20,15,15,15)
  q=51
  v=weightedVotingGameVector(n=5,w,q)
  pgi=publicGoodIndex(v)
  
  expect_equal(pgi,c(16/60,8/60,12/60,12/60,12/60))
})

#RUSER 2017
test_that("Check 12.2 - test publicGoodIndex  ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  v=weightedVotingGameVector(n=4,w=c(309,193,63,64),q=315)
  result=publicGoodIndex(v)
  expect_equal(result,c(3/9,2/9,2/9,2/9))
})