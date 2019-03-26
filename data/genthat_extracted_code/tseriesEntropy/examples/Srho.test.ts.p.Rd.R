library(tseriesEntropy)


### Name: Srho.test.ts.p
### Title: Entropy Tests Of Serial And Cross Dependence For Time Series -
###   Parallel Version
### Aliases: Srho.test.ts.p
### Keywords: ts

### ** Examples

## Not run: 
##D ## ************************************************************
##D ## WARNING: computationally intensive, increase B with caution
##D ## ************************************************************
##D set.seed(13)
##D n      <- 120
##D w      <- rnorm(n)
##D x      <- arima.sim(n, model = list(ar=0.8));
##D y      <- arima.sim(n, model = list(ar=0.8));
##D z      <- lag(x,-1) + rnorm(n,sd=2) # dependence at lag 1
##D # UNIVARIATE VERSION
##D res1 <- Srho.test.ts.p(w, lag.max = 5,  B = 40, ci.type="perm") # independence
##D res2 <- Srho.test.ts.p(x, lag.max = 5,  B = 40, ci.type="perm") # dependence
##D 
##D # BIVARIATE VERSION
##D res3 <- Srho.test.ts.p(x, y, lag.max = 5,  B = 40, ci.type="mbb") # independence
##D res4 <- Srho.test.ts.p(x, z, lag.max = 5,  B = 40, ci.type="mbb") # dependence
## End(Not run)


