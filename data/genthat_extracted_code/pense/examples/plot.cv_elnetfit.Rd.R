library(pense)


### Name: plot.cv_elnetfit
### Title: Plot Method for Cross-Validated Elastic Net Models
### Aliases: plot.cv_elnetfit

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

y <- x %*% c(rep(c(2, 5), each = 3), numeric(p - 6)) + rnorm(n)

# Compute the classical EN and select the optimal lambda by CV
set.seed(1234)
est_en <- elnet_cv(
    x, y,
    alpha = 0.5
)

# By default, `plot` shows the CV prediction error
plot(est_en)
# We can also plot the coefficient paths
plot(est_en, what = "coef.path")

# Compute the LASSO solution
set.seed(1234)
est_lasso <- elnet_cv(
    x, y,
    alpha = 1
)

plot(est_lasso)
plot(est_lasso, what = "coef.path")



