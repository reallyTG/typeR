library(tseriesEntropy)


### Name: Trho.test.SA
### Title: Entropy Tests For Nonlinearity In Time Series
### Aliases: Trho.test.SA
### Keywords: ts

### ** Examples

## Not run: 
##D set.seed(13)
##D x      <- arima.sim(n=120, model = list(ar=0.8));
##D result <- Trho.test.SA(x, lag.max = 5,  B = 10, bw='reference', method='integral')
## End(Not run)


