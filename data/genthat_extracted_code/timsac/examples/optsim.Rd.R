library(timsac)


### Name: optsim
### Title: Optimal Control Simulation
### Aliases: optsim
### Keywords: ts

### ** Examples

# Multivariate Example Data
ar <- array(0, dim = c(3,3,2))
ar[, , 1] <- matrix(c(0.4,  0,    0.3,
                      0.2, -0.1, -0.5,
                      0.3,  0.1, 0), nrow = 3, ncol = 3, byrow = TRUE)
ar[, , 2] <- matrix(c(0,  -0.3,  0.5,
                      0.7, -0.4,  1,
                      0,   -0.5,  0.3), nrow = 3, ncol = 3, byrow = TRUE)
x <- matrix(rnorm(200*3), nrow = 200, ncol = 3)
y <- mfilter(x, ar, "recursive")
q.mat <- matrix(c(0.16,0,0,0.09), nrow = 2, ncol = 2)
r.mat <- as.matrix(0.001)
optsim(y, max.order = 10, ns = 20, q = q.mat, r = r.mat, len = 20)



