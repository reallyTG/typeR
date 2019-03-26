library(drmdel)


### Name: quantileDRM
### Title: Estimate the quantiles of the populations under the DRM
### Aliases: quantileDRM
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

# Quantile estimation
# Denote the p^th quantile of the k^th, k=0, 1, ..., 4,
# population as q_{k,p}.

# Estimate q_{0,0.25}, q_{0,0.6}, q_{1,0.1} and q_{2,0.1}.
(qe <- quantileDRM(k=c(0, 0, 1, 2), p=c(0.25, 0.6, 0.1, 0.1),
                  drmfit=drmfit))

# Estimate the 0.05^th, 0.2^th and 0.8^th quantiles of F_3
(qe1 <- quantileDRM(k=3, p=c(0.05, 0.2, 0.8), drmfit=drmfit))
 
# Estimate the 0.05^th quantiles of F_1, F_3 and F_4
(qe2 <- quantileDRM(k=c(1 , 3, 4), p=0.05, drmfit=drmfit))



