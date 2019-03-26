library(robfilter)


### Name: hybrid.filter
### Title: Robust Hybrid Filtering Methods for Univariate Time Series
### Aliases: hybrid.filter
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
y.hy <- hybrid.filter(y, width=31)
# Plot:
plot(y.hy)

# Filtering with running median and PRMH only:
y2.hy <- hybrid.filter(y, width=31, method=c("MED","PRMH"))
plot(y2.hy)



