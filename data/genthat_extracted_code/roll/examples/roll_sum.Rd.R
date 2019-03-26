library(roll)


### Name: roll_sum
### Title: Rolling Sums
### Aliases: roll_sum

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling sums
result <- roll_sum(x, 5)

# rolling sums with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_sum(x, 5, weights)



