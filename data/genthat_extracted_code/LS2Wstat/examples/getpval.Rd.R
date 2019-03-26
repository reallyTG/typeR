library(LS2Wstat)


### Name: getpval
### Title: Computes a p-value for the output of the test for stationarity.
### Aliases: getpval
### Keywords: statistic

### ** Examples

#Generate a stationary image

testimage <- matrix(rnorm(64*64), nrow=64, ncol=64)

# Run test of stationarity

## Not run: 
##D TestofStat<-TOS2D(testimage)
##D 
##D # Obtain p-value
##D 
##D getpval(TestofStat$samples)
## End(Not run)




