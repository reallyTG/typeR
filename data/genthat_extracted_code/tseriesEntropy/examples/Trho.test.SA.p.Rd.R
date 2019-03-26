library(tseriesEntropy)


### Name: Trho.test.SA.p
### Title: Entropy Tests For Nonlinearity In Time Series - Parallel Version
### Aliases: Trho.test.SA.p
### Keywords: ts

### ** Examples

## Not run: 
##D # modifiy nslaves to match the number of available cores
##D set.seed(13)
##D x      <- arima.sim(n=120, model = list(ar=0.8));
##D result <- Trho.test.SA.p(x, lag.max = 5, B = 100, bw='reference', nslaves=2)
##D 
##D ## ** Compare timings **
##D system.time(Trho.test.SA.p(x, lag.max = 5, B = 100, bw='reference', nslaves=4))
##D system.time(Trho.test.SA(x, lag.max = 5, B = 100, bw='reference'))
## End(Not run)


