library(SNPknock)


### Name: SNPknock.models.sampleHMM
### Title: Sample hidden Markov models
### Aliases: SNPknock.models.sampleHMM

### ** Examples

p=10; K=5; M=3;
pInit = rep(1/K,K)
Q = array(stats::runif((p-1)*K*K),c(p-1,K,K))
for(j in 1:(p-1)) { Q[j,,] = Q[j,,] / rowSums(Q[j,,]) }
pEmit = array(stats::runif(p*M*K),c(p,M,K))
for(j in 1:p) { pEmit[j,,] = pEmit[j,,] / rowSums(pEmit[j,,]) }
X = SNPknock.models.sampleHMM(pInit, Q, pEmit, n=20)
 



