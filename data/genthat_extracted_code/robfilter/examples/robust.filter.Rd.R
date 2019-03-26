library(robfilter)


### Name: robust.filter
### Title: Robust Filtering Methods for Univariate Time Series
### Aliases: robust.filter
### Keywords: robust smooth ts

### ** Examples

# Generate random time series:
y <- cumsum(runif(500)) - .5*(1:500)
# Add jumps:
y[200:500] <- y[200:500] + 5
y[400:500] <- y[400:500] - 7
# Add noise:
n <- sample(1:500, 30)
y[n] <- y[n] + rnorm(30)

# Delayed Filtering of the time series with window width 23:
y.rf <- robust.filter(y, width=23)
# Plot:
plot(y.rf)

# Delayed Filtering with different settings and fixed window width 31:
y.rf2 <- robust.filter(y, width=31, trend="LMS", scale="QN", outlier="W")
plot(y.rf2)

# Online Filtering with fixed window width 24:
y.rf3 <- robust.filter(y, width=24, online=TRUE)
plot(y.rf3)

# Delayed Filtering with adaptive window width (minimal width 11, maximal width 51):
y.rf4 <- robust.filter(y, width=11, adapt=0.7, max.width=51)
plot(y.rf4)



