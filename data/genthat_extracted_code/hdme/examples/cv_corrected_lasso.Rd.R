library(hdme)


### Name: cv_corrected_lasso
### Title: Cross-validated Corrected lasso
### Aliases: cv_corrected_lasso

### ** Examples

# Gaussian
set.seed(100)
n <- 100; p <- 50 # Problem dimensions
# True (latent) variables
X <- matrix(rnorm(n * p), nrow = n)
# Measurement error covariance matrix
# (typically estimated by replicate measurements)
sigmaUU <- diag(x = 0.2, nrow = p, ncol = p)
# Measurement matrix (this is the one we observe)
W <- X + rnorm(n, sd = diag(sigmaUU))
# Coefficient
beta <- c(seq(from = 0.1, to = 1, length.out = 5), rep(0, p-5))
# Response
y <- X %*% beta + rnorm(n, sd = 1)
# Run the corrected lasso
cvfit <- cv_corrected_lasso(W, y, sigmaUU, no_radii = 5, n_folds = 3)
plot(cvfit)
# Run the standard lasso using the radius found by cross-validation
fit <- fit_corrected_lasso(W, y, sigmaUU, family = "gaussian",
radii = cvfit$radius_min)



