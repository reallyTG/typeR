library(pracma)


### Name: savgol
### Title: Savitzky-Golay Smoothing
### Aliases: savgol
### Keywords: timeseries

### ** Examples

# *** Sinosoid test function ***
ts <- sin(2*pi*(1:1000)/200)
t1 <- ts + rnorm(1000)/10
t2 <- savgol(t1, 51)
## Not run: 
##D plot( 1:1000, t1, col = "grey")
##D lines(1:1000, ts, col = "blue")
##D lines(1:1000, t2, col = "red")
## End(Not run)



