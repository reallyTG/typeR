library(hwwntest)


### Name: cumperiod
### Title: Compute cumulative normalized periodogram.
### Aliases: cumperiod
### Keywords: ts

### ** Examples

#
# Use example time series
#
x <- rnorm(100)

x.cp <- cumperiod(x)
#
# Can plot it, if you like
#
## Not run: 
##D plot(x.cp$wp, x.cp$cumperiod, type="l", xlab="Frequency",
##D 	ylab="Cumulative Normalized Periodogram")
## End(Not run)
#
# You can try replacing the x by, say, an AR(1) using arima.sim and
# you'll get a very different shaped line, depending on the AR(1)
# parameter.



