library(NMOF)


### Name: testFunctions
### Title: Classical Test Functions for Unconstrained Optimisation
### Aliases: testFunctions tfAckley tfEggholder tfGriewank tfRastrigin
###   tfRosenbrock tfSchwefel tfTrefethen tfTrefethen
### Keywords: optimize

### ** Examples

## persp for two-dimensional x

## Ackley
n <- 100L; surf <- matrix(NA, n, n)
x1 <- seq(from = -2, to = 2, length.out = n)
for (i in 1:n)
    for (j in 1:n)
        surf[i, j] <- tfAckley(c(x1[i], x1[j]))
persp(x1, x1, -surf, phi = 30, theta = 30, expand = 0.5,
      col = "goldenrod1", shade = 0.2, ticktype = "detailed",
      xlab = "x1", ylab = "x2", zlab = "-f", main = "Ackley (-f)",
      border = NA)

## Trefethen
n <- 100L; surf <- matrix(NA, n, n)
x1 <- seq(from = -10, to = 10, length.out = n)
for (i in 1:n)
    for (j in 1:n)
        surf[i, j] <- tfTrefethen(c(x1[i], x1[j]))
persp(x1, x1, -surf, phi = 30, theta = 30, expand = 0.5,
      col = "goldenrod1", shade = 0.2, ticktype = "detailed",
      xlab = "x1", ylab = "x2", zlab = "-f", main = "Trefethen (-f)",
      border = NA)



