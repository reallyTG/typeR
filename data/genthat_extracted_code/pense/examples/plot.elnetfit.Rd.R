library(pense)


### Name: plot.elnetfit
### Title: Plot Method for Fitted Elastic Net Models
### Aliases: plot.elnetfit

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

# Compute the classical EN
est_en <- elnet(
    x, y,
    alpha = 0.5
)

# The `plot` method for the `elnet` output shows the coefficient paths
plot(est_en)
# --> from the paths it can be seen that the variables 1,2,3 and 4,5,6 are
# grouped together

# Compute the LASSO solution
est_lasso <- elnet(
    x, y,
    alpha = 1
)

# The LASSO solution, on the other hand, can not unveil the grouping
# structure
plot(est_lasso)

# Compute the Ridge solution
est_ridge <- elnet(
    x, y,
    alpha = 0
)

# The Ridge also shows the grouping structure very nicely
plot(est_ridge)




