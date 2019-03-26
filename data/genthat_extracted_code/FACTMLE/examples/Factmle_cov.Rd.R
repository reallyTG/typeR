library(FACTMLE)


### Name: Factmle_cov
### Title: Calculates the Maximum likelihood Factor analysis with a
###   covariance Matrix.
### Aliases: Factmle_cov

### ** Examples



library(MASS)
library(stats)
Psi=runif(15,min=0.2,max=1.3)
Lambda=mvrnorm(n=15,mu=rep(0,3),Sigma = diag(rep(1,3)))
data=mvrnorm(n=5000,mu=rep(0,15),Sigma = diag(Psi)+Lambda%*%t(Lambda))
S=cov(data)
x=Factmle_cov(S,3)





