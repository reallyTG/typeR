library(LaplacesDemon)


### Name: dist.Matrix.Normal
### Title: Matrix Normal Distribution
### Aliases: dmatrixnorm rmatrixnorm
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
N <- 10
K <- 4
U <- as.positive.definite(matrix(rnorm(N*N),N,N))
V <- as.positive.definite(matrix(rnorm(K*K),K,K))
x <- dmatrixnorm(matrix(0,N,K), matrix(0,N,K), U, V)
X <- rmatrixnorm(matrix(0,N,K), U, V)
joint.density.plot(X[,1], X[,2], color=TRUE)



