library(drmdel)


### Name: quantileCompWald
### Title: Wald test for pairwise comparison and linear hypotheses about
###   quantiles under the DRM
### Aliases: quantileCompWald
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

# Quantile comparisons
# Compare the 5^th percentile of population 0, 1, 2 and 3.

# Estimate these quantiles first
qe <- quantileDRM(k=c(0, 1, 2, 3), p=0.05, drmfit=drmfit)

# Create a matrix A and a vector b for testing the equality
# of all these 5^th percentiles. Note that, for this test,
# the contrast matrix A is not unique.
A <- matrix(rep(0, 12), 3, 4)
A[1,] <- c(1, -1, 0, 0)
A[2,] <- c(0, 1, -1, 0)
A[3,] <- c(0, 0, 1, -1)
b <- rep(0, 3)

# Quantile comparisons
# No p-value adjustment for pairwise comparisons
(qComp <- quantileCompWald(qe, n_total=sum(n_samples), A=A,
                           b=b))

# Adjust the p-values for pairwise comparisons using the
# "holm" method.
(qComp1 <- quantileCompWald(qe, n_total=sum(n_samples),
                            p_adj_method="holm", A=A, b=b))



