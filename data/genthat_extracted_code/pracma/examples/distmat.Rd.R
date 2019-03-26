library(pracma)


### Name: distmat
### Title: Distance Matrix
### Aliases: distmat pdist pdist2
### Keywords: array

### ** Examples

A <- c(0.0, 0.0)
B <- matrix(c(
        0,0, 1,0, 0,1, 1,1), nrow=4, ncol = 2, byrow = TRUE)
distmat(A, B)  #=> 0 1 1 sqrt(2)

X <- matrix(rep(0.5, 5), nrow=1, ncol=5)
Y <- matrix(runif(50), nrow=10, ncol=5)
distmat(X, Y)



