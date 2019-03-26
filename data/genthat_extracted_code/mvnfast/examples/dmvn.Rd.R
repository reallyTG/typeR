library(mvnfast)


### Name: dmvn
### Title: Fast computation of the multivariate normal density.
### Aliases: dmvn

### ** Examples

N <- 100
d <- 5
mu <- 1:d
X <- t(t(matrix(rnorm(N*d), N, d)) + mu)
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)  + diag(0.5, d)
myChol <- chol(mcov)

head(dmvn(X, mu, mcov), 10)
head(dmvn(X, mu, myChol, isChol = TRUE), 10)

## Not run: 
##D # Performance comparison: microbenchmark does not work on all
##D # platforms, hence we need to check whether it is installed
##D if( "microbenchmark" %in% rownames(installed.packages()) ){
##D library(mvtnorm)
##D library(microbenchmark)
##D 
##D a <- cbind(
##D       dmvn(X, mu, mcov),
##D       dmvn(X, mu, myChol, isChol = TRUE),
##D       dmvnorm(X, mu, mcov))
##D       
##D # Check if we get the same output as dmvnorm()
##D a[ , 1] / a[, 3]
##D a[ , 2] / a[, 3]
##D 
##D microbenchmark(dmvn(X, mu, myChol, isChol = TRUE), 
##D                dmvn(X, mu, mcov), 
##D                dmvnorm(X, mu, mcov))
##D                
##D detach("package:mvtnorm", unload=TRUE)
##D }
## End(Not run)




