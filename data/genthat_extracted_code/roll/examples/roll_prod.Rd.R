library(roll)


### Name: roll_prod
### Title: Rolling Products
### Aliases: roll_prod

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling products
result <- roll_prod(x, 5)

# rolling products with exponential decay
weights <- 0.9 ^ (5:1)
result <- roll_prod(x, 5, weights)



