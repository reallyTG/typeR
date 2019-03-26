library(ape)


### Name: matexpo
### Title: Matrix Exponential
### Aliases: matexpo
### Keywords: array multivariate

### ** Examples

### a simple rate matrix:
m <- matrix(0.1, 4, 4)
diag(m) <- -0.3
### towards equilibrium:
for (t in c(1, 5, 10, 50)) print(matexpo(m*t))



