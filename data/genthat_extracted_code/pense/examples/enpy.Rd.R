library(pense)


### Name: enpy
### Title: PY (Pena-Yohai) initial estimates for EN S-estimators
### Aliases: enpy

### ** Examples

set.seed(12345)
n <- 50
p <- 15
beta <- c(2:5, numeric(p - 4))
x <- 1 + matrix(rnorm(n * p), ncol = p)
y <- x %*% beta  + rnorm(n)

# add outliers to y
y[1:5] <- rnorm(5, -100, 0.5)

x_test <- matrix(rnorm(10 * n * p), ncol = p)
y_test <- drop(x_test %*% beta + rnorm(n))

# Compute the PY using the "exact" solutions. Here, the LOO residuals
# are computed using the EN estimator directly. For this method,
# the DAL algorithm is usually faster since it naturally supports
# "warm" starts from a nearby solution vector.
init_exact <- enpy(
    x, y,
    alpha = 0.8,
    lambda = 0.1,
    delta = 0.25,
    options = initest_options(
        psc_method = "exact"
    ),
    en_options = en_options_dal()
)

# Compute the PY using the approximate ("rr") solutions. Here, the LOO residuals
# are approximated by ridge regression, where all the LOO residuals can be
# computed at once using linear algebra.
init_approx <- enpy(
    x, y,
    alpha = 0.8,
    lambda = 0.1,
    delta = 0.25,
    options = initest_options(
        psc_method = "rr"
    ),
    en_options = en_options_aug_lars()
)

# How do they objective functions of the initial estimates compare?
min(init_exact$objF)
min(init_approx$objF)
# The "exact" method finds slightly estimates with slightly lower objective.

# How do the initial estimates perform on an external test set?
rmspe_exact <- colMeans((y_test - cbind(1, x_test) %*% init_exact$coeff)^2)
rmspe_approx <- colMeans((y_test - cbind(1, x_test) %*% init_approx$coeff)^2)

min(rmspe_exact)
min(rmspe_approx)
# The "exact" method also has better predictive power



