library(SteinIV)


### Name: sps.est
### Title: Semi-parametric Stein-like (SPS) estimator.
### Aliases: sps.est
### Keywords: ols.est tsls.est

### ** Examples


### Generate a simple example with synthetic data, and no intercept. 
n <- 100; k <- 3; l <- 3;
Ga<- diag(rep(1,l)); be <- rep(1,k);
Z <- matrix(0,n,l); for(j in 1:l) Z[,j] <- rnorm(n); 
X <- matrix(0,n,k); for(j in 1:k) X[,j] <- Z[,j]*Ga[j,j] + rnorm(n); 
y <- X%*%be + rnorm(n);

### Compute SPS estimator with SEs and variance/covariance matrix.
print(sps.est(y,X,Z))
print(sps.est(y,X,Z,SE=TRUE));




