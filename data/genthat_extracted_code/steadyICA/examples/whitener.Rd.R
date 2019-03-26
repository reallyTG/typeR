library(steadyICA)


### Name: whitener
### Title: Whitening function
### Aliases: whitener whiten
### Keywords: whiten prewhiten standardize

### ** Examples

simData <- cbind(rnorm(1000,1,2),rnorm(1000,-1,3),rnorm(1000,4,1))
simMVN <- simData%*%matrix(rnorm(12),3,4)
simWhiten <- whitener(simMVN,n.comp = 3)
colMeans(simWhiten$Z)
cov(simWhiten$Z)




