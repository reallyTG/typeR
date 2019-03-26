library(blockseg)


### Name: rblockdata
### Title: Random generation noisy block-wise matrices
### Aliases: rblockdata

### ** Examples

## model parameters
n <- 100
K <- 5
mu <- suppressWarnings(matrix(rep(c(1,0),ceiling(K**2/2)), K,K))
Y <- rblockdata(n,mu,sigma=.5)




