library(robfilter)


### Name: rm.filter
### Title: Repeated Median (RM) filter
### Aliases: rm.filter
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

# Online filtering with RM filter:
y.rr <- rm.filter(y,width=41,online=TRUE)
plot(y.rr)



