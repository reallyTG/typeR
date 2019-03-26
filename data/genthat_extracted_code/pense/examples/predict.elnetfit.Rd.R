library(pense)


### Name: predict.elnetfit
### Title: Predict Method for the classical Elastic Net Estimator
### Aliases: predict.elnetfit

### ** Examples

# Generate data with highly correlated groups of variables
set.seed(12345)
n <- 100
p <- 20
x <- 1 + matrix(rnorm(n * p), ncol = p)
x[, 2] <- x[, 1] + rnorm(n, sd = 0.01)
x[, 3] <- x[, 1] + rnorm(n, sd = 0.01)
x[, 5] <- x[, 4] + rnorm(n, sd = 0.01)
x[, 6] <- x[, 4] + rnorm(n, sd = 0.01)

y <- drop(x %*% c(rep(c(2, 5), each = 3), numeric(p - 6)) + rnorm(n))

# Compute the classical EN and select the optimal lambda by CV
set.seed(1234)
est_en_cv <- elnet_cv(
    x, y,
    alpha = 0.5,
    correction = TRUE
)

# For cross-validated EN fits, the `coef`, `predict`, and `residuals` methods
# return/use the estimated coefficients at the "optimal" lambda
coef(est_en_cv) # Extract coefficients
predict(est_en_cv) # Extract fitted values
predict(est_en_cv, newdata = x) # Predict values
residuals(est_en_cv) # Extract residuals

# We can also request the coefficient at another lambda. By default,
# this will interpolate between the solutions at the two surrounding
# lambda values.
coef(est_en_cv, lambda = 6)

# If needed, the solution at the given lambda can also be computed exactly.
coef(est_en_cv, lambda = 6, exact = TRUE)


# If we compute the EN estimator without choosing an optimal lambda,
# the lambda parameter needs to be specified in the call to coef
est_en <- elnet(
    x, y,
    alpha = 0.5
)

# Without specifying lambda, the `coef` method would raise an error.
coef(est_en, lambda = 6)



