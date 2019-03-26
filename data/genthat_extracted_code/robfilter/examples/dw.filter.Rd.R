library(robfilter)


### Name: dw.filter
### Title: Robust Double Window Filtering Methods for Univariate Time
###   Series
### Aliases: dw.filter dw.filter.online
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
y.dw <- dw.filter(y, outer.width=31, inner.width=11, method="all")
# Plot:
plot(y.dw)

# Filtering with trimmed RM and double window TRM only:
y2.dw <- dw.filter(y, outer.width=31, inner.width=11, method=c("TRM","DWTRM"))
plot(y2.dw)



