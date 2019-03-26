library(roll)


### Name: roll_any
### Title: Rolling Any
### Aliases: roll_any

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling any
result <- roll_any(x < 0, 5)




