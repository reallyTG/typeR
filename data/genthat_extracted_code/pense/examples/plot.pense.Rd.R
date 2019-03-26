library(pense)


### Name: plot.pense
### Title: Plot Method for Fitted Penalized Elastic Net S/MM-Estimates of
###   Regression
### Aliases: plot.pense

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
est_en <- pense(x, y, alpha = 0.5, warm_reset = 1, cv_k = 3, nlambda = 25)

# The `plot` method by default shows the CV prediction error
plot(est_en)

# We can also plot the coefficient paths which shows that variables 1-3 and
# 4-6 appear to be grouped
plot(est_en, "coef.path")

# Compute the LASSO solution
set.seed(1234)
est_lasso <- pense(x, y, alpha = 1, warm_reset = 1, cv_k = 3, nlambda = 25,
                   init_options = initest_options(psc_method = "exact"))
plot(est_lasso)
plot(est_lasso, "coef.path")
# The coefficient path from the LASSO does not show the grouping anymore.



