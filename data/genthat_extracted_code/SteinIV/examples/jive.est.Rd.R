library(SteinIV)


### Name: jive.est
### Title: The Jackknife Instrumental Variable Estimator (JIVE).
### Aliases: jive.est
### Keywords: ols.est tsls.est sps.est

### ** Examples


### Generate a simple example with synthetic data, and no intercept. 
n <- 100; k <- 3; l <- 3;
Ga<- diag(rep(1,l)); be <- rep(1,k);
Z <- matrix(0,n,l); for(j in 1:l) Z[,j] <- rnorm(n); 
X <- matrix(0,n,k); for(j in 1:k) X[,j] <- Z[,j]*Ga[j,j] + rnorm(n); 
y <- X%*%be + rnorm(n);

### Compute JIVE estimator with SEs and variance/covariance matrix.
print(jive.est(y,X,Z))
print(jive.est(y,X,Z,SE=TRUE));




