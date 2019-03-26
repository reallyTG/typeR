library(GeDS)


### Name: Derive
### Title: Derivative of GeDS objects
### Aliases: Derive

### ** Examples

# Generate a data sample for the response variable
# Y and the covariate X
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N, min = -2, max = 2))
# Specify a model for the mean of Y to include only
# a component non-linear in X, defined by the function f_1
means <- f_1(X)
# Add (Normal) noise to the mean of Y
Y <- rnorm(N, means, sd = 0.1)

# Fit GeDS regression with only a spline component in the predictor model
Gmod <- NGeDS(Y ~ f(X), beta = 0.6, phi = 0.995, Xextr = c(-2,2))

# Compute the second derivative of the cubic GeDS fit
# at the points 0, -1 and 1
Derive(Gmod, x = c(0, -1, 1), order = 2, n = 4)



