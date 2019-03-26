library(CVTuningCov)


### Name: CVTuningCov-package
### Title: Select Tuning Parameters based on CV in Regularized Estimators
###   of Covariance Matrices
### Aliases: CVTuningCov-package CVTuningCov
### Keywords: banding covariance matrix cross-validation Frobenius norm
###   operator norm thresholding

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



