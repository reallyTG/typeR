library(roll)


### Name: roll_sd
### Title: Rolling Standard Deviations
### Aliases: roll_sd

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling standard deviations
result <- roll_sd(x, 5)

# rolling standard deviations with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_sd(x, 5, weights)



