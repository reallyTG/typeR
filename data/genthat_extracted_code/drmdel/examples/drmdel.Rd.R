library(drmdel)


### Name: drmdel
### Title: Fit a density ratio model
### Aliases: drmdel
### Keywords: models methods

### ** Examples

# Data generation
set.seed(25)
n_samples <- c(100, 200, 180, 150, 175)  # sample sizes
x0 <- rgamma(n_samples[1], shape=5, rate=1.8)
x1 <- rgamma(n_samples[2], shape=12, rate=1.2)
x2 <- rgamma(n_samples[3], shape=12, rate=1.2)
x3 <- rgamma(n_samples[4], shape=18, rate=5)
x4 <- rgamma(n_samples[5], shape=25, rate=2.6)
x <- c(x0, x1, x2, x3, x4)

# Fit a DRM with the basis function q(x) = (x, log(abs(x))),
# which is the basis function for gamma family.

# There are 11 built-in basis function in drmdel(). And q(x)
# = (x, log(abs(x))) is the 6th basis function, so we can
# fit the model by specifying basis_func=6 in drmdel() as
# follows:
drmfit <- drmdel(x=x, n_samples=n_samples, basis_func=6)
names(drmfit)

# A brief summary of the DRM fit
summaryDRM(drmfit)

# Another way of specifying basis function for drmdel() is
# to pass a user-specified R function to the basis_func
# argument of the drmdel() function.
# NOTE: If the basis function one wants to use is included
# in the built-in function list, one should use the built-in
# functions by passing an integer between 1 to 11 to the
# drmdel() function, because the computation will be faster
# with a built-in function than with a user-specified
# function.
basis_gamma <- function(x) return(c(x, log(abs(x))))
drmfit1 <- drmdel(x=x, n_samples=n_samples,
                  basis_func=basis_gamma)

# One can see the summary of this DRM fit is exactly the
# same as that of the previous fit with basis_func=6
summaryDRM(drmfit1)



