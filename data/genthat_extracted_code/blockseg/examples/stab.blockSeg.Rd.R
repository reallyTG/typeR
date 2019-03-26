library(blockseg)


### Name: stab.blockSeg
### Title: 'stab.blockSeg' algorithm
### Aliases: stab.blockSeg

### ** Examples

 ## model parameters
n <- 100
K <- 5
mu <- suppressWarnings(matrix(rep(c(1,0),ceiling(K**2/2)), K,K))
Y <- rblockdata(n,mu,sigma=.5)$Y
res <- stab.blockSeg(Y, 100, 20)




