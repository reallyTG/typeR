library(roll)


### Name: roll_max
### Title: Rolling Maximums
### Aliases: roll_max

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling maximums
result <- roll_max(x, 5)

# rolling maximums with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_max(x, 5, weights)



