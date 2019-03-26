library(sdPrior)


### Name: hyperpar
### Title: Find Scale Parameters for Inverse Gamma Hyperprior of Nonlinear
###   Effects with Spike and Slab Prior (Simulation-based)
### Aliases: hyperpar

### ** Examples

set.seed(123)
library(MASS)
# prior precision matrix (second order differences) 
# of a spline of degree l=3 and with m=22 inner knots
# yielding dim(K)=m+l-1=22
K <- t(diff(diag(22), differences=2))%*%diff(diag(22), differences=2)
# generalised inverse of K (same as if we used mixed model representation!)
Kinv <- ginv(K)
# covariate x
x <- runif(1)
Z <- matrix(DesignM(x)$Z_B,nrow=1)
fgrid <- seq(-3,3,length=1000)
mdf <- hyperpar(Z,Kinv,a=5,c=0.1,alpha1=0.05,alpha2=0.05,R=10000,myseed=123)




