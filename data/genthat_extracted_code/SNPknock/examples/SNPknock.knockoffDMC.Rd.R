library(SNPknock)


### Name: SNPknock.knockoffDMC
### Title: Knockoff copies of a discrete Markov chain
### Aliases: SNPknock.knockoffDMC

### ** Examples

p=10; K=5;
pInit = rep(1/K,K)
Q = array(stats::runif((p-1)*K*K),c(p-1,K,K))
for(j in 1:(p-1)) { Q[j,,] = Q[j,,] / rowSums(Q[j,,]) }
X = SNPknock.models.sampleDMC(pInit, Q, n=20)
Xk = SNPknock.knockoffDMC(X, pInit, Q)




