library(GeDS)


### Name: lines,GeDS-method
### Title: Lines method for GeDS objects. Adds a GeDS curve to an existing
###   plot.
### Aliases: lines,GeDS-method lines.GeDS

### ** Examples


# Generate a data sample for the response variable
# Y and the single covariate X
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N, min = -2, max = 2))
# Specify a model for the mean of Y to include only a component
# non-linear in X, defined by the function f_1
means <- f_1(X)
# Add (Normal) noise to the mean of Y
Y <- rnorm(N, means, sd = 0.1)

# Fit a GeDS regression model using NGeDS
(Gmod <- NGeDS(Y ~ f(X), beta = 0.6, phi = 0.995, Xextr = c(-2,2)))

# Plot the GeDS third order fit (the quadratic one)
# without its corresponding Polygon
plot(Gmod, type = "none")

# Add a curve corresponding to the second order fit (the linear one)
lines(Gmod, n = 2, col = "green", lwd = 2, lty = 3)



