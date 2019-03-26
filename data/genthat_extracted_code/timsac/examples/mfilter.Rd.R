library(timsac)


### Name: mfilter
### Title: Linear Filtering on a Multivariate Time Series
### Aliases: mfilter
### Keywords: ts

### ** Examples

#AR model simulation
ar <- array(0, dim = c(3,3,2))
ar[, , 1] <- matrix(c(0.4,  0,   0.3,
                      0.2, -0.1, -0.5,
                      0.3,  0.1, 0), nrow = 3, ncol = 3, byrow = TRUE)
ar[, , 2] <- matrix(c(0,  -0.3,  0.5,
                      0.7, -0.4,  1,
                      0,   -0.5,  0.3), nrow = 3, ncol = 3, byrow = TRUE)
x <- matrix(rnorm(100*3), nrow = 100, ncol = 3)
y <- mfilter(x, ar, "recursive")

#Back to white noise
ma <- array(0, dim = c(3,3,3))
ma[, , 1] <- diag(3)
ma[, , 2] <- -ar[, , 1]
ma[, , 3] <- -ar[, , 2]
z <- mfilter(y, ma, "convolution")
mulcor(z)

#AR-MA model simulation
x <- matrix(rnorm(1000*2), nrow = 1000, ncol = 2)
ma <- array(0, dim = c(2,2,2))
ma[, , 1] <- matrix(c( -1.0,  0.0,
                        0.0, -1.0), nrow = 2, ncol = 2, byrow = TRUE)
ma[, , 2] <- matrix(c( -0.2,  0.0,
                       -0.1, -0.3), nrow = 2, ncol = 2, byrow = TRUE)
y <- mfilter(x, ma, "convolution")

ar <- array(0, dim = c(2,2,3))
ar[, , 1] <- matrix(c( -1.0,  0.0,
                        0.0, -1.0), nrow = 2, ncol = 2, byrow = TRUE)
ar[, , 2] <- matrix(c( -0.5, -0.2,
                       -0.2, -0.5), nrow = 2, ncol = 2, byrow = TRUE)
ar[, , 3] <- matrix(c( -0.3, -0.05,
                       -0.1, -0.30), nrow = 2, ncol = 2, byrow = TRUE)
z <- mfilter(y, ar, "recursive")



