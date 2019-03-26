library(blockseg)


### Name: criteria
### Title: Penalized criteria based on estimation of degrees of freedom
### Aliases: criteria criteria,blockSeg-method

### ** Examples

n <- 100
K <- 5
mu <- suppressWarnings(matrix(rep(c(1,0),ceiling(K**2/2)), K,K))
Y <- rblockdata(n,mu,sigma=.5)$Y
res <- blockSeg(Y, 50)
criteria(res, Y, sigma=.5)




