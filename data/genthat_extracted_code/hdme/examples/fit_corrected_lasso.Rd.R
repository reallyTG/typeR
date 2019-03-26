library(hdme)


### Name: fit_corrected_lasso
### Title: Corrected Lasso
### Aliases: fit_corrected_lasso

### ** Examples

# Example with linear regression
# Number of samples
n <- 100
# Number of covariates
p <- 50
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
fit <- fit_corrected_lasso(W, y, sigmaUU, family = "gaussian")
plot(fit)

# Binomial, logistic regression
# Number of samples
n <- 1000
# Number of covariates
p <- 50
# True (latent) variables
X <- matrix(rnorm(n * p), nrow = n)
# Measurement error covariance matrix
sigmaUU <- diag(x = 0.2, nrow = p, ncol = p)
# Measurement matrix (this is the one we observe)
W <- X + rnorm(n, sd = diag(sigmaUU))
logit <- function(x) (1+exp(-x))^(-1)
# Response
y <- rbinom(n, size = 1, prob = logit(X %*% c(rep(5, 5), rep(0, p-5))))
fit <- fit_corrected_lasso(W, y, sigmaUU, family = "binomial")
plot(fit)





