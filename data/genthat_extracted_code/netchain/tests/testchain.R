library(netchain)

test_that("Test whether binary (Y, A, C) are appropriately generated from chain graph model",{
  weight.matrix = matrix(c(0.5, 1, 0, 1, 0.3, 0.5, 0, 0.5, -0.5), 3, 3)
  simobs = simGibbs(n.unit = 3, n.gibbs = 10, n.sample = 10, 
                    weight.matrix,
                    treat.matrix = 0.5*diag(3), cov.matrix= (-0.3)*diag(3) )
  inputY = simobs$inputY
  inputA = simobs$inputA
  
  expect_equal(dim(inputY), dim(inputA))

})


test_that("Test that causal probability on collective outcomes is estimated",{
  weight.matrix = matrix(c(0.5, 1, 0, 1, 0.3, 0.5, 0, 0.5, -0.5), 3, 3)
  simobs = simGibbs(n.unit = 3, n.gibbs = 10, n.sample = 10, 
                    weight.matrix,
                    treat.matrix = 0.5*diag(3), cov.matrix= 0*diag(3) )
  inputY = simobs$inputY
  inputA = simobs$inputA
  
  R.matrix = ifelse(weight.matrix==0, 0, 1)      
  diag(R.matrix) = 0
  
  result = chain.causal.multi(targetoutcome = "mean", treatment = c(1,0,0), 
                              inputY, inputA, listC = NULL, R.matrix = R.matrix, E.matrix = diag(3), 
                              n.obs = 2, n.burn = 1)
  
  expect_true(result$causalprob > 0 & result$causalprob < 1)
  expect_equal(result$n.par, 8)
  expect_equal(length(result$par.est), 8)
  
})


test_that("Test that chain graph model can be used to identify causally influential units on social network",{
  weight.matrix = matrix(c(0.5, 1, 0, 1, 0.3, 0.5, 0, 0.5, -0.5), 3, 3)
  simobs = simGibbs(n.unit = 3, n.gibbs = 10, n.sample = 10, 
                    weight.matrix,
                    treat.matrix = 0.5*diag(3), cov.matrix= 0*diag(3) )
  inputY = simobs$inputY
  inputA = simobs$inputA
  
  R.matrix = ifelse(weight.matrix==0, 0, 1)      
  diag(R.matrix) = 0
  
  influence = causal.influence(targetoutcome = c(1,1,1), Avalues = c(1,0), 
                               inputY, inputA, listC = NULL, R.matrix, E.matrix = diag(3), n.obs = 2, n.burn = 1)
  
  expect_true(sum(influence$influence > 0 & influence$influence < 1) == 3)
  expect_equal(influence$n.par, 8)
  expect_equal(length(influence$par.est), 8)
  
})