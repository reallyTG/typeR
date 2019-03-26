library(CVTuningCov)


### Name: regular.CV
### Title: Select Tuning Parameter for Regularized Covariance Matrix by
###   K-fold CV
### Aliases: regular.CV
### Keywords: K-fold cross-validation covariance matrix

### ** Examples

library(MASS);
n <- 50;
p <- 50;
fold <- 3;
k.grid <- seq(0,2*(p-1),by=1);
Sigma <- AR1(p, rho=0.6);
X <- mvrnorm(n,rep(0,p),Sigma);
CV.F.fit <- regular.CV(X,k.grid, method='Tapering',fold=fold,norm='F');
CV.F.fit$CV.k;



