library(LaplacesDemon)


### Name: dist.Inverse.Matrix.Gamma
### Title: Inverse Matrix Gamma Distribution
### Aliases: dinvmatrixgamma
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
k <- 10
dinvmatrixgamma(X=diag(k), alpha=(k+1)/2, beta=2, Psi=diag(k), log=TRUE)
dinvwishart(Sigma=diag(k), nu=k+1, S=diag(k), log=TRUE)



