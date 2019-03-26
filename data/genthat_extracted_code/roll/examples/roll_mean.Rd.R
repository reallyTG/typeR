library(roll)


### Name: roll_mean
### Title: Rolling Means
### Aliases: roll_mean

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling means
result <- roll_mean(x, 5)

# rolling means with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_mean(x, 5, weights)



