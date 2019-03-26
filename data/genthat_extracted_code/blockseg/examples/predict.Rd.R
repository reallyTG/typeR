library(blockseg)


### Name: predict,blockSeg-method
### Title: Predict method for a 'blockSeg' object
### Aliases: predict,blockSeg-method

### ** Examples

require(blockseg)
n <- 100
K <- 5
mu <- suppressWarnings(matrix(rep(c(1,0),ceiling(K**2/2)), K,K))
Y <- rblockdata(n,mu,sigma=.5)$Y
res <- blockSeg(Y, 100)
predict(res, Y, lambda=slot(res, "Lambda")[1:3])




