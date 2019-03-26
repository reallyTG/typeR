library(roll)


### Name: roll_var
### Title: Rolling Variances
### Aliases: roll_var

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling variances
result <- roll_var(x, 5)

# rolling variances with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_var(x, 5, weights)



