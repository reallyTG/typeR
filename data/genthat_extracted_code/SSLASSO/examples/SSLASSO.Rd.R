library(SSLASSO)


### Name: SSLASSO
### Title: The Spike-and-Slab LASSO
### Aliases: SSLASSO

### ** Examples

## Linear regression, where p > n

library(SSLASSO)

p <- 1000
n <- 100

X <- matrix(rnorm(n*p), nrow = n, ncol = p)
beta <- c(1, 2, 3, rep(0, p-3))
y = X[,1] * beta[1] + X[,2] * beta[2] + X[,3] * beta[3] + rnorm(n)

# Oracle SSLASSO with known variance

result1 <- SSLASSO(X, y, penalty = "separable", theta = 3/p)
plot(result1)

# Adaptive SSLASSO with known variance

result2 <- SSLASSO(X, y)
plot(result2)

# Adaptive SSLASSO with unknown variance

result3 <- SSLASSO(X, y, variance = "unknown")
plot(result3)




