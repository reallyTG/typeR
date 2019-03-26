library(roll)


### Name: roll_scale
### Title: Rolling Scaling and Centering
### Aliases: roll_scale

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling z-scores
result <- roll_scale(x, 5)

# rolling z-scores with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_scale(x, 5, weights)



