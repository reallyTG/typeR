library(blockseg)


### Name: plot,stab.blockSeg-method
### Title: Plot method for a 'stab.blockSeg' object
### Aliases: plot,stab.blockSeg-method

### ** Examples

## Not run: 
##D n <- 100
##D ## model parameters
##D K <- 5
##D mu <- suppressWarnings(matrix(rep(c(1,0),ceiling(K**2/2)), K,K))
##D Y <- rblockdata(n,mu,sigma=.5)$Y
##D stab.out <- stab.blockSeg(Y, 100, 15)
##D plot(stab.out,Y)
## End(Not run)



