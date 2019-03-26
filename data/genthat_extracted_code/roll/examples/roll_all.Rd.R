library(roll)


### Name: roll_all
### Title: Rolling All
### Aliases: roll_all

### ** Examples

n_vars <- 3
n_obs <- 15
x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)

# rolling all
result <- roll_all(x < 0, 5)




