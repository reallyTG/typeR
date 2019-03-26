library(GeDS)


### Name: Integrate
### Title: Defined integral of GeDS objects
### Aliases: Integrate

### ** Examples

# Generate a data sample for the response variable
# Y and the single covariate X
# see Dimitrova et al. (2017), section 4.1
set.seed(123)
N <- 500
f_1 <- function(x) (10*x/(1+100*x^2))*4+4
X <- sort(runif(N, min = -2, max = 2))
# Specify a model for the mean of Y to include only
# a component non-linear in X, defined by the function f_1
means <- f_1(X)
# Add (Normal) noise to the mean of Y
Y <- rnorm(N, means, sd = 0.1)

# Fit GeDS regression using NGeDS
Gmod <- NGeDS(Y ~ f(X), beta = 0.6, phi = .995, Xextr = c(-2,2))

# Compute defined integrals (in TeX style) $\int_{1}^{-1} f(x)dx$
# and $\int_{1}^{1} f(x)dx$
# $f$ being the quadratic fit
Integrate(Gmod, to = c(-1,1), from = 1, n = 3)

# Compute defined integrals (in TeX style) $\int_{1}^{-1} f(x)dx$
# and $\int_{-1}^{1} f(x)dx$
# $f$ being the quadratic fit
Integrate(Gmod, to = c(-1,1), from = c(1,-1), n = 3)

## Not run: 
##D ## This gives an error
##D Integrate(Gmod, to = 1, from = c(1,-1), n = 3)
## End(Not run)



