boolSkip=F

test_that("Check 35.1 - publicGoodIndex ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  result=publicGoodIndex(c(0,0,0,0,1,1,1,0,0,0,1,1,1,0,1))

  expect_equal(result,c(0.5,1/6,1/6,1/6))
})



test_that("Check 35.2 - publicGoodIndex4cVector example Holler Illing chapter 6.3.4 ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  w=c(35,20,15,15,15)
  q=51
  hv=c(16/60,8/60,12/60,12/60,12/60)
  A=weightedVotingGameVector(n=5,w,q)
  result=publicGoodIndex(A)
  expect_equal(hv,result)
})


test_that("Check 35.3 - publicGoodIndex4cVector example Holler Illing chapter 6.3.4 ",{
  if(boolSkip){
    skip("Test was skipped")
  }
  result=publicGoodIndex(v=c(0,0,0,1,1,0,1))
  expect_equal(result,c(1/2,1/4,1/4))
})
