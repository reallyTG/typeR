library(pracma)


### Name: whittaker
### Title: Whittaker Smoothing
### Aliases: whittaker
### Keywords: timeseries

### ** Examples

# **Sinosoid test function**
ts <- sin(2*pi*(1:1000)/200)
t1 <- ts + rnorm(1000)/10
t3 <- whittaker(t1, lambda = 1600)
## Not run: 
##D plot(1:1000, t1, col = "grey")
##D lines(1:1000, ts, col="blue")
##D lines(1:1000, t3, col="red")
## End(Not run)



