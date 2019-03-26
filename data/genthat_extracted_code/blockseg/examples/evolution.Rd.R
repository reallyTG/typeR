library(blockseg)


### Name: evolution
### Title: Plot method for a 'stab.blockSeg' object
### Aliases: evolution evolution,stab.blockSeg-method

### ** Examples

n <- 100
## model parameters
K <- 5
mu <- suppressWarnings(matrix(rep(c(1,0),ceiling(K**2/2)), K,K))
Y <- rblockdata(n,mu,sigma=.5)$Y
stab.out <- stab.blockSeg(Y, 100, 15)
evolution(stab.out,Y)




