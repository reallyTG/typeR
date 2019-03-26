library(drmdel)


### Name: cdfDRM
### Title: Estimate the CDF of the populations under the DRM
### Aliases: cdfDRM
### Keywords: methods

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
# which is the basis function for gamma family. This basis
# function is the built-in basis function 6.
drmfit <- drmdel(x=x, n_samples=n_samples, basis_func=6)

# Estimate the CDF of population 1 at c(3, 7.5, 11) and that
# of population 3 at c(2, 6).
cdf_est1 <- cdfDRM(k=c(1, 3), x=list(c(3, 7.5, 11), c(2, 6)),
                   drmfit=drmfit)
# Show the output.
names(cdf_est1)
cdf_est1$F1
cdf_est1$F3

# Estimate the CDF of population 2 and 4 at the observed
# data points.
cdf_est <- cdfDRM(k=c(2, 4), drmfit=drmfit)
# Show the output.
names(cdf_est)
cdf_est$F2
cdf_est$F4



