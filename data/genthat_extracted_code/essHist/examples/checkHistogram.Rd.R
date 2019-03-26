library(essHist)


### Name: checkHistogram
### Title: Check any estimator by means of the multiscale confidence set
### Aliases: checkHistogram
### Keywords: distribution

### ** Examples

set.seed(123)
# Data: mixture of Gaussians 1/3 N(0,0.5) + 1/3 N(5,1) + 1/3 N(15,2)
n  = 500
y  = rmixnorm(n, mean = c(0, 5, 15), sd = c(0.5, 1, 2))

# Oracle density
sy = sort(y)
ho = dmixnorm(sy, mean = c(0, 5, 15), sd = c(0.5, 1, 2))

# R default histogram
h  = hist(y, plot = FALSE)

# Check R default histogram to local multiscale constriants
b = checkHistogram(h, y)
lines(sy, ho, col = "red")
legend("topright", c("R-Histogram", "Truth"), col = c("black", "red"), lty = c(1,1))



