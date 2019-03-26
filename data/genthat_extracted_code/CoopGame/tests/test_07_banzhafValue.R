boolSkip=F




test_that("Check 07.1 - normalizedBanzhafIndex",{
  if(boolSkip){
    skip("Test was skipped")
  }

  #N=c(1,2,3), w=(50,49,1), q=1
  A1=weightedVotingGameVector(w=c(50,49,1),n=3,q=1)
  bv1=normalizedBanzhafIndex(A1)
  expect_equal(bv1,c(1/3,1/3,1/3))
  
  #N=c(1,2,3), w=(50,49,1), q=51
  A51=weightedVotingGameVector(w=c(50,49,1),n=3,q=51)
  bv51=normalizedBanzhafIndex(A51)
  expect_equal(bv51,c(3/5,1/5,1/5))
  
  #N=c(1,2,3), w=(50,49,1), q=52
  A52=weightedVotingGameVector(w=c(50,49,1),n=3,q=52)
  bv52=normalizedBanzhafIndex(A52)
  expect_equal(bv52,c(1/2,1/2,0.0))
  
  #N=c(1,2,3), w=(50,49,1), q=100
  A100=weightedVotingGameVector(w=c(50,49,1),n=3,q=100)
  bv100=normalizedBanzhafIndex(A100)
  expect_equal(bv100,c(1/3,1/3,1/3))
  
})

