library(robfilter)


### Name: robreg.filter
### Title: Robust Regression Filters for Univariate Time Series
### Aliases: robreg.filter
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

# Filtering with all methods:
y.rr <- robreg.filter(y, width=31, method=c("RM", "LMS", "LTS", "DR", "LQD"))
# Plot:
plot(y.rr)

# Delayed filtering with RM and LMS filter:
y2.rr <- robreg.filter(y,width=31,method=c("RM","LMS"))
plot(y2.rr)

# Online filtering with RM filter:
y3.rr <- rm.filter(y,width=41,online=TRUE)
plot(y3.rr)



