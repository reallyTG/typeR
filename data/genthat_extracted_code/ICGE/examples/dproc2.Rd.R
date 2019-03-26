library(ICGE)


### Name: dproc2
### Title: Modified Procrustes distance
### Aliases: dproc2
### Keywords: multivariate

### ** Examples

# Given  10  hypothetical time course profiles
# over 6 time points at 1, 2, ..., 6 hours.
x <- matrix(c(0.38, 0.39, 0.38, 0.37, 0.385, 0.375,
              0.99, 1.19, 1.50, 1.83, 2.140, 2.770,
              0.38, 0.50, 0.71, 0.72, 0.980, 1.010,
              0.20, 0.40, 0.70, 1.06, 2.000, 2.500,
              0.90, 0.95, 0.97, 1.50, 2.500, 2.990,
              0.64, 2.61, 1.51, 1.34, 1.330 ,1.140,
              0.71, 1.82, 2.28, 1.72, 1.490, 1.060,
              0.71, 1.82, 2.28, 1.99, 1.975, 1.965,
              0.49, 0.78, 1.00, 1.27, 0.590, 0.340,
              0.71,1.00, 1.50, 1.75, 2.090, 1.380), nrow=10, byrow=TRUE)

# Graphical representation
matplot(t(x), type="b")

# Distance matrix between them
d <- dproc2(x)




