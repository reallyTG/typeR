library(roll)


### Name: roll_min
### Title: Rolling Minimums
### Aliases: roll_min

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling minimums
result <- roll_min(x, 5)

# rolling minimums with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_min(x, 5, weights)



