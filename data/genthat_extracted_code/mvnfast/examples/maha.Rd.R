library(mvnfast)


### Name: maha
### Title: Fast computation of squared mahalanobis distance between all
###   rows of 'X' and the vector 'mu' with respect to sigma.
### Aliases: maha

### ** Examples

N <- 100
d <- 5
mu <- 1:d
X <- t(t(matrix(rnorm(N*d), N, d)) + mu)
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)
myChol <- chol(mcov)

rbind(head(maha(X, mu, mcov), 10),
      head(maha(X, mu, myChol, isChol = TRUE), 10),
      head(mahalanobis(X, mu, mcov), 10))

## Not run: 
##D # Performance comparison: microbenchmark does not work on all
##D # platforms, hence we need to check whether it is installed
##D if( "microbenchmark" %in% rownames(installed.packages()) ){
##D library(microbenchmark)
##D 
##D a <- cbind(
##D   maha(X, mu, mcov),
##D   maha(X, mu, myChol, isChol = TRUE),
##D   mahalanobis(X, mu, mcov))
##D   
##D # Same output as mahalanobis
##D a[ , 1] / a[, 3]
##D a[ , 2] / a[, 3]
##D 
##D microbenchmark(maha(X, mu, mcov),
##D                maha(X, mu, myChol, isChol = TRUE),
##D                mahalanobis(X, mu, mcov))
##D }
## End(Not run)



