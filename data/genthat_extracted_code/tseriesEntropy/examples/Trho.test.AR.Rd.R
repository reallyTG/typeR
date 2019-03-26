library(tseriesEntropy)


### Name: Trho.test.AR
### Title: Entropy Tests For Nonlinearity In Time Series
### Aliases: Trho.test.AR
### Keywords: ts

### ** Examples

## Not run: 
##D set.seed(13)
##D x      <- arima.sim(n=120, model = list(ar=0.8));
##D result <- Trho.test.AR(x, lag.max = 5,  B = 10, bw='reference', method='integral')
## End(Not run)


