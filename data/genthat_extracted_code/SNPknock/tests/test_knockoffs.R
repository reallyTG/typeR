test_that('Markov chain knockoffs have the right correlation structure', {
  p=20; # Number of variables in the model
  K=3;  # Number of possible states for each variable
  # Marginal distribution for the first variable
  pInit = rep(1/K,K)
  # Create p-1 transition matrices
  Q = array(stats::runif((p-1)*K*K),c(p-1,K,K))
  for(j in 1:(p-1)) { 
    Q[j,,] = Q[j,,] + diag(rep(1,K))
    Q[j,,] = Q[j,,] / rowSums(Q[j,,]) 
  }
  
  X = SNPknock.models.sampleDMC(pInit, Q, n=100000)
  Xk = SNPknock.knockoffDMC(X, pInit, Q)
  
  expect_knockMatch(X, Xk, tolMeans=1e-2, tolCorr=1e-2)
})

test_that('Hidden Markov model knockoffs have the right correlation structure', {
  p=20; # Number of variables in the model
  K=5;  # Number of possible states for each variable
  M=3;  # Number of possible emission states for each variable
  # Marginal distribution for the first variable
  pInit = rep(1/K,K)
  # Create p-1 transition matrices
  Q = array(stats::runif((p-1)*K*K),c(p-1,K,K))
  rho = stats::runif(p-1, min = 1, max = 50)
  for(j in 1:(p-1)) { 
    Q[j,,] = Q[j,,] + rho[j] * diag(rep(1,K))
    Q[j,,] = Q[j,,] / rowSums(Q[j,,]) 
  }
  # Create p emission matrices
  pEmit = array(stats::runif(p*M*K),c(p,M,K))
  for(j in 1:p) { pEmit[j,,] = sweep(pEmit[j,,],2,colSums(pEmit[j,,]),`/`) }
  
  X = SNPknock.models.sampleHMM(pInit, Q, pEmit, n=500000)
  Xk = SNPknock.knockoffHMM(X, pInit, Q, pEmit)
  
  expect_knockMatch(X, Xk, tolMeans=1e-2, tolCorr=1e-2)
})