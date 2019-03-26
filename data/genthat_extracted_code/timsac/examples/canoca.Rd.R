library(timsac)


### Name: canoca
### Title: Canonical Correlation Analysis of Vector Time Series
### Aliases: canoca
### Keywords: ts

### ** Examples

ar <- array(0, dim = c(3,3,2))
ar[, , 1] <- matrix(c(0.4,  0,   0.3,
                      0.2, -0.1, -0.5,
                      0.3,  0.1, 0), nrow = 3, ncol = 3, byrow= TRUE)
ar[, , 2] <- matrix(c(0,  -0.3,  0.5,
                      0.7, -0.4,  1,
                      0,   -0.5,  0.3), nrow = 3, ncol = 3, byrow = TRUE)
x <- matrix(rnorm(1000*3), nrow = 1000, ncol = 3)
y <- mfilter(x, ar, "recursive")
z <- canoca(y)
z$arcoef



