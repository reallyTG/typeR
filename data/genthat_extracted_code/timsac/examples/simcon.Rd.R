library(timsac)


### Name: simcon
### Title: Optimal Controller Design and Simulation
### Aliases: simcon
### Keywords: ts

### ** Examples

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
                       -0.1, -0.3), nrow = 2, ncol = 2, byrow = TRUE)
y <- mfilter(y, ar, "recursive")

z <- markov(y)
weight <-  matrix(c(0.0002,  0.0,
                    0.0,     2.9 ), nrow = 2, ncol = 2, byrow = TRUE)
simcon(span = 50, len = 700, r = 1, z$arcoef, z$impulse, z$v, weight)



