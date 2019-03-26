library(roll)


### Name: roll_median
### Title: Rolling Medians
### Aliases: roll_median

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling medians
result <- roll_median(x, 5)

# rolling medians with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_median(x, 5, weights)



