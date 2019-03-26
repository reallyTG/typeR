library(ivmodel)


### Name: iv.diagnosis
### Title: Diagnostics of instrumental variable analysis
### Aliases: iv.diagnosis iv.diagnosis.plot

### ** Examples

n <- 10000
Z <- rbinom(n, 1, 0.5)
X <- data.frame(matrix(rbinom(n * 5, 1, 0.5), n))
D <- rbinom(n, 1, plogis(Z + X[, 1] + X[, 2] + X[, 3]))
Y <- D + X[, 1] + X[, 2] + rnorm(n)
output <- iv.diagnosis(Y, D, Z, X)
print(output)
iv.diagnosis.plot(output)




