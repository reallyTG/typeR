library(SNPknock)


### Name: SNPknock.models.sampleDMC
### Title: Sample discrete Markov chains
### Aliases: SNPknock.models.sampleDMC

### ** Examples

p=10; K=5;
pInit = rep(1/K,K)
Q = array(stats::runif((p-1)*K*K),c(p-1,K,K))
for(j in 1:(p-1)) { Q[j,,] = Q[j,,] / rowSums(Q[j,,]) }
X = SNPknock.models.sampleDMC(pInit, Q, n=20)




