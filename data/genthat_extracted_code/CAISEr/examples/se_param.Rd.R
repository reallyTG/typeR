library(CAISEr)


### Name: se_param
### Title: Parametric standard errors
### Aliases: se_param

### ** Examples

# two vectors of normally distributed observations
set.seed(1234)
x1 <- rnorm(100, 5, 1)  # mean = 5, sd = 1
x2 <- rnorm(200, 10, 2) # mean = 10, sd = 2

# Theoretical SE for simple difference: 0.1732051
se_param(x1, x2, dif = "simple")

# Theoretical (Fieller, no covariance) SE for percent differences: 0.04
se_param(x1, x2, dif = "perc")



