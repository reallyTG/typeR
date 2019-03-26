library(tseriesEntropy)


### Name: Trho.test.AR.p
### Title: Entropy Tests For Nonlinearity In Time Series - Parallel Version
### Aliases: Trho.test.AR.p
### Keywords: ts

### ** Examples

## Not run: 
##D 
##D # modifiy nslaves to match the number of available cores
##D set.seed(13)
##D b      <- 100
##D x      <- arima.sim(n=120, model = list(ar=0.8));
##D result <- Trho.test.AR.p(x, lag.max = 5, B=b, bw='reference', nslaves=2)
##D 
##D ## ** Compare timings **
##D system.time(Trho.test.AR.p(x,lag.max = 5,B=b, bw='reference', nslaves=4))
##D system.time(Trho.test.AR(x,  lag.max = 5,B=b, bw='reference'))
## End(Not run)


