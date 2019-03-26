library(ebdbNet)


### Name: hankel
### Title: Perform Singular Value Decomposition of Block-Hankel Matrix
### Aliases: hankel
### Keywords: methods

### ** Examples

library(ebdbNet)
tmp <- runif(1) ## Initialize random number generator
set.seed(125214) ## Save seed

## Simulate data
y <- simulateVAR(R = 5, T = 10, P = 10, v = rep(10, 10), perc = 0.10)$y

## Determine the number of hidden states to be estimated (with lag = 1)
K <- hankel(y, lag = 1, cutoff = 0.90, type = "median")$dim
## K = 5




