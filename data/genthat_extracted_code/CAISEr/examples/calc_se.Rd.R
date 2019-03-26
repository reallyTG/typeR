library(CAISEr)


### Name: calc_se
### Title: Calculates the standard error for simple and percent differences
### Aliases: calc_se

### ** Examples

# two vectors of normally distributed observations
set.seed(1234)
x1 <- rnorm(100, 5, 1)  # mean = 5, sd = 1
x2 <- rnorm(200, 10, 2) # mean = 10, sd = 2

# Theoretical SE for simple difference: 0.1732051
calc_se(x1, x2, dif = "simple", method = "param")

# Theoretical (Fieller, no covariance) SE for percent differences: 0.04
calc_se(x1, x2, dif = "perc", method = "boot")



