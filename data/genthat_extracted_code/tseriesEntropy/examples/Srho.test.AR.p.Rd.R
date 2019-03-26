library(tseriesEntropy)


### Name: Srho.test.AR.p
### Title: Entropy Tests For Nonlinearity In Time Series - Parallel Version
### Aliases: Srho.test.AR.p
### Keywords: ts

### ** Examples

## Not run: 
##D ## ************************************************************
##D ## WARNING: computationally intensive, increase B with caution
##D ## ************************************************************
##D 
##D # modify nslaves to match the number of available cores
##D set.seed(13)
##D x      <- arima.sim(n=120, model = list(ar=0.8));
##D result <- Srho.test.AR.p(x, lag.max = 5,  B = 100, bw='reference', method='integral', nslaves=2)
##D 
##D ## ** Compare timings **
##D system.time(Srho.test.AR.p(x, lag.max = 5,  B = 100, bw='reference', method='integral', nslaves=4))
##D system.time(Srho.test.AR(x, lag.max = 5,  B = 100, bw='reference', method='integral'))
## End(Not run)


