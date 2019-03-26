library(spBayes)


### Name: mkMvX
### Title: Make a multivariate design matrix
### Aliases: mkMvX
### Keywords: manip

### ** Examples

## Not run: 
##D ##Define some univariate model design matrices
##D ##with intercepts.
##D X.1 <- cbind(rep(1, 10), matrix(rnorm(50), nrow=10))
##D X.2 <- cbind(rep(1, 10), matrix(rnorm(20), nrow=10))
##D X.3 <- cbind(rep(1, 10), matrix(rnorm(30), nrow=10))
##D 
##D ##Make a multivariate design matrix suitable
##D ##for use in spPredict.
##D X.mv <- mkMvX(list(X.1, X.2, X.3))
## End(Not run)



