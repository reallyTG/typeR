library(GeDS)


### Name: coef.GeDS
### Title: Coef method for GeDS objects
### Aliases: coef.GeDS coefficients.GeDS

### ** Examples

# Generate a data sample for the response variable
# and the covariates
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N ,min = -2, max = 2))
Z <- runif(N)
# Specify a model for the mean of the response Y to be a superposition of
# a non-linear component f_1(X), a linear component 2*Z and a
# free term 1, i.e.
means <- f_1(X) + 2*Z + 1
# Add normal noise to the mean of y
Y <- rnorm(N, means, sd = 0.1)

# Fit to this sample a predictor model of the form f(X) + Z, where
# f(X) is the GeDS component and Z is the linear (additive) component
# see ?formula.GeDS for details
(Gmod <- NGeDS(Y ~ f(X) + Z, beta = 0.6, phi = 0.995, Xextr = c(-2,2)))

# Extract the GeD spline regression coefficients
coef(Gmod, n = 3)

# Extract all the coefficients, including the one for the linear component
coef(Gmod, onlySpline = FALSE, n = 3)



