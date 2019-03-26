library(sdPrior)


### Name: mdf_ig
### Title: Marginal Density for Given Scale Parameter and Inverse Gamma
###   Prior for tau^2
### Aliases: mdf_ig

### ** Examples

set.seed(123)
library(MASS)
# prior precision matrix (second order differences) 
# of a spline of degree l=3 and with m=20 inner knots
# yielding dim(K)=m+l-1=22
K <- t(diff(diag(22), differences=2))%*%diff(diag(22), differences=2)
# generalised inverse of K
Kinv <- ginv(K)
# covariate x
x <- runif(1)
Z <- matrix(DesignM(x)$Z_B,nrow=1)
fgrid <- seq(-3,3,length=1000)
mdf <- mdf_ig(fgrid,theta=0.0028,Z=Z,Kinv=Kinv)




