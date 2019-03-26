library(matrixsampling)


### Name: rwishart_chol
### Title: Sampling Cholesky factor of a Wishart matrix
### Aliases: rwishart_chol

### ** Examples

nu <- 4
p <- 3
Sigma <- diag(p)
Wsims <- rwishart_chol(10000, nu, Sigma)
dim(Wsims) # 3 3 10000
Wsims[,,1]



