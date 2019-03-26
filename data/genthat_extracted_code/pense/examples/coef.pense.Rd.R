library(pense)


### Name: coef.pense
### Title: Extract Model Coefficients
### Aliases: coef.pense

### ** Examples

# Generate data with highly correlated groups of variables and some outliers
set.seed(12345)
n <- 50
n_out <- 3
p <- 20
x <- 1 + matrix(rnorm(n * p), ncol = p)
x[, 2] <- x[, 1] + rnorm(n, sd = 0.01)
x[, 3] <- x[, 1] + rnorm(n, sd = 0.01)
x[, 5] <- x[, 4] + rnorm(n, sd = 0.01)
x[, 6] <- x[, 4] + rnorm(n, sd = 0.01)

y <- x %*% c(rep(c(2, 5), each = 3), numeric(p - 6)) + rnorm(n)

y[seq_len(n_out)] <- rnorm(n_out, -100, sd = 3)

# Compute the PENSE estimator
set.seed(1234)
est_en <- pense(x, y, alpha = 0.5, warm_reset = 1, cv_k = 3)

# From the fitted model we can extract the coefficients, fitted values, and
# residuals at the "optimal" lambda as chosen by CV.
coef(est_en) # Extract coefficients
predict(est_en) # Extract fitted values
predict(est_en, newdata = x) # Predict values
residuals(est_en) # Extract residuals

# We can also request the coefficients/predicitons/residuals at another lambda.
# If the requested lambda is not in the original lambda grid, the methods
# will approximate the coefficient vector by linear interpolation of
# the solutions at the surrounding lambda values.
coef(est_en, lambda = 5)

# If the exact solution is needed, this can be requested
coef(est_en, lambda = 5, exact = TRUE)
residuals(est_en, lambda = 5, exact = TRUE)



