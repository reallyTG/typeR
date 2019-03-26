library(LaplacesDemon)


### Name: dist.Matrix.Gamma
### Title: Matrix Gamma Distribution
### Aliases: dmatrixgamma
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
k <- 10
dmatrixgamma(X=diag(k), alpha=(k+1)/2, beta=2, Sigma=diag(k), log=TRUE)
dwishart(Omega=diag(k), nu=k+1, S=diag(k), log=TRUE)



