library(tseriesEntropy)


### Name: Srho.test.ts
### Title: Entropy Tests Of Serial And Cross Dependence For Time Series
### Aliases: Srho.test.ts
### Keywords: ts

### ** Examples

## Not run: 
##D ## ***********************************************************
##D ## WARNING: computationally intensive, increase B with caution
##D ##          and use the parallel version
##D ## ***********************************************************
##D 
##D set.seed(13)
##D n      <- 120
##D w      <- rnorm(n)
##D x      <- arima.sim(n, model = list(ar=0.8));
##D y      <- arima.sim(n, model = list(ar=0.8));
##D z      <- lag(x,-1) + rnorm(n,sd=2) # dependence at lag 1
##D # UNIVARIATE VERSION
##D res1 <- Srho.test.ts(w, lag.max = 5,  B = 10, bw='reference', method='integral'
##D     ,ci.type="perm") # independence
##D res2 <- Srho.test.ts(x, lag.max = 5,  B = 10, bw='reference', method='integral'
##D     ,ci.type="perm") # dependence
##D 
##D # BIVARIATE VERSION
##D res3 <- Srho.test.ts(x, y, lag.max = 5,  B = 10, bw='reference', method='integral'
##D ,ci.type="mbb") # independence (try at least B = 100 for meaningful results)
##D res4 <- Srho.test.ts(x, z, lag.max = 5,  B = 10, bw='reference', method='integral'
##D ,ci.type="mbb") # dependence
## End(Not run)


