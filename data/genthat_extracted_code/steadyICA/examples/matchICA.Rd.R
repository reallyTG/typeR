library(steadyICA)


### Name: matchICA
### Title: match independent components using the Hungarian method
### Aliases: matchICA
### Keywords: hungarian ICA

### ** Examples

set.seed(999)
nObs <- 1024
nComp <- 3
# simulate from some gamma distributions:
simS<-cbind(rgamma(nObs, shape = 1, scale = 2),
            rgamma(nObs, shape = 3, scale = 2),
            rgamma(nObs, shape = 9, scale = 0.5))

simM <- matrix(rnorm(9),3)
pMat <- matrix(c(0,-1,0,1,0,0,0,0,-1),3)
permS <- simS%*%pMat
permM <- t(pMat)%*%simM

matchedS <- matchICA(S = permS, template = simS, M = permM)
sum(abs(matchedS$S - simS))
sum(abs(simM - matchedS$M))



