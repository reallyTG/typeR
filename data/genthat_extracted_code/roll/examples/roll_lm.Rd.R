library(roll)


### Name: roll_lm
### Title: Rolling Linear Models
### Aliases: roll_lm

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
y <- matrix(rnorm(n_obs), nrow = n_obs, ncol = 1)

# rolling regressions
result <- roll_lm(x, y, 5)

# rolling regressions with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_lm(x, y, 5, weights)



