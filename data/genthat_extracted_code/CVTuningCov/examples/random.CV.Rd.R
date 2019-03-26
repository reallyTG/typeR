library(CVTuningCov)


### Name: random.CV
### Title: Select Tuning Parameter for Regularized Covariance Matrix by
###   Random CV
### Aliases: random.CV
### Keywords: cross-validation covariance matrix

### ** Examples

library(MASS);
n <- 50;
p <- 50;
fold <- 3;
k.grid <- seq(0,2*(p-1),by=1);
Sigma <- AR1(p, rho=0.6);
X <- mvrnorm(n,rep(0,p),Sigma);
CV.F.fit <- random.CV(X,k.grid, method='Tapering',test.size = 10,norm='F');
CV.F.fit$CV.k;



