library(robfilter)


### Name: dr.filter
### Title: Deepest Regression (DR) filter
### Aliases: dr.filter
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

# Online filtering with DR filter:
y.rr <- dr.filter(y,width=41,online=TRUE)
plot(y.rr)



