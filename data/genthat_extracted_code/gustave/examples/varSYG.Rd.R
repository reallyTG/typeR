library(gustave)


### Name: varSYG
### Title: Sen-Yates-Grundy variance estimator
### Aliases: varSYG

### ** Examples

library(sampling)
set.seed(1)

# Simple random sampling case
N <- 1000
n <- 100
y <- rnorm(N)[as.logical(srswor(n, N))]
pikl <- matrix(rep((n*(n-1))/(N*(N-1)), n*n), nrow = n)
diag(pikl) <- rep(n/N, n)
varSYG(y, pikl)
sampling::varHT(y = y, pikl = pikl, method = 2)



