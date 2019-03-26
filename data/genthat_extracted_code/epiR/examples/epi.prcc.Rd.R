library(epiR)


### Name: epi.prcc
### Title: Partial rank correlation coefficients
### Aliases: epi.prcc
### Keywords: univar

### ** Examples

## Create a matrix of simulation results:
x1 <- data.frame(rnorm(n = 10, mean = 120, sd = 10))
x2 <- data.frame(rnorm(n = 10, mean = 80, sd = 5))
x3 <- data.frame(rnorm(n = 10, mean = 40, sd = 20))
y <- 2 + (0.5 * x1) + (0.7 * x2) + (0.2 * x3)

dat <- data.frame(cbind(X1 = x1, X2 = x2, X3 = x3, Y = y))
epi.prcc(dat, sided.test = 2)




