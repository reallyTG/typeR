library(sdPrior)


### Name: get_theta_ig
### Title: Find Scale Parameter for Inverse Gamma Hyperprior
### Aliases: get_theta_ig

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
theta <- get_theta_ig(alpha = 0.01, method = "integrate", Z = Z, 
                      c = 3, eps = .Machine$double.eps, Kinv = Kinv, 
					 equals = FALSE, a = 1, type="marginalt")$root




