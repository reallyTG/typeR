library(tseriesEntropy)


### Name: Srho.test.AR
### Title: Entropy Tests For Nonlinearity In Time Series
### Aliases: Srho.test.AR
### Keywords: ts

### ** Examples

## Not run: 
##D ## ************************************************************
##D ## WARNING: computationally intensive, increase B with caution
##D ## ************************************************************
##D set.seed(13)
##D x      <- arima.sim(n=120, model = list(ar=0.8));
##D result <- Srho.test.AR(x, lag.max = 5,  B = 10, bw='reference', method='integral')
## End(Not run)


