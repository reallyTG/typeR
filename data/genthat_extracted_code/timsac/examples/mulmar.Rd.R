library(timsac)


### Name: mulmar
### Title: Multivariate Case of Minimum AIC Method of AR Model Fitting
### Aliases: mulmar
### Keywords: ts

### ** Examples

# Example 1
data(Powerplant)
z <- mulmar(Powerplant, max.order = 10)
z$arcoef

# Example 2
ar <- array(0, dim = c(3,3,2))
ar[, , 1] <- matrix(c(0.4,  0,   0.3,
                      0.2, -0.1, -0.5,
                      0.3,  0.1, 0), nrow = 3, ncol = 3, byrow = TRUE)
ar[, , 2] <- matrix(c(0,  -0.3,  0.5,
                      0.7, -0.4,  1,
                      0,   -0.5,  0.3), nrow = 3, ncol = 3,byrow = TRUE)
x <- matrix(rnorm(200*3), nrow = 200, ncol = 3)
y <- mfilter(x, ar, "recursive")
z <- mulmar(y, max.order = 10)
z$arcoef



