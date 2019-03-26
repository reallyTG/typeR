library(JADE)


### Name: SIR
### Title: Signal to Interference Ratio
### Aliases: SIR
### Keywords: multivariate

### ** Examples

S <- cbind(rt(1000, 4), rnorm(1000), runif(1000))
A <- matrix(rnorm(9), ncol = 3)
X <- S %*% t(A)

S.hat <- JADE(X, 3)$S
SIR(S, S.hat)



