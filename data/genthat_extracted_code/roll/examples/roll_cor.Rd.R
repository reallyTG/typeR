library(roll)


### Name: roll_cor
### Title: Rolling Correlation Matrices
### Aliases: roll_cor

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling correlation matrices
result <- roll_cor(x, width = 5)

# rolling correlation matrices with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_cor(x, width = 5, weights = weights)



