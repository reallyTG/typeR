## ------------------------------------------------------------------------
library(SNPknock)

## ----=-------------------------------------------------------------------
p=50; # Number of variables in the model
K=5;  # Number of possible states for each variable
# Marginal distribution for the first variable
pInit = rep(1/K,K)
# Create p-1 transition matrices
Q = array(stats::runif((p-1)*K*K),c(p-1,K,K))
for(j in 1:(p-1)) { 
  Q[j,,] = Q[j,,] + diag(rep(1,K))
  Q[j,,] = Q[j,,] / rowSums(Q[j,,]) 
}

## ------------------------------------------------------------------------
set.seed(1234)
X = SNPknock.models.sampleDMC(pInit, Q, n=100)
print(X[1:5,1:10])

## ------------------------------------------------------------------------
Xk = SNPknock.knockoffDMC(X, pInit, Q)
print(Xk[1:5,1:10])

## ------------------------------------------------------------------------
p=200; # Number of variables in the model
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

## ------------------------------------------------------------------------
set.seed(1234)
X = SNPknock.models.sampleHMM(pInit, Q, pEmit, n=100)
print(X[1:5,1:10])

## ------------------------------------------------------------------------
Xk = SNPknock.knockoffHMM(X, pInit, Q, pEmit)
print(Xk[1:5,1:10])

