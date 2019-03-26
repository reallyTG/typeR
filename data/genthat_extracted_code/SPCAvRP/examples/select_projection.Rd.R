library(SPCAvRP)


### Name: select_projection
### Title: Selects the best projection
### Aliases: select_projection

### ** Examples

p <-  100
k <- 10
n <- 1000
v1 <- c(rep(1/sqrt(k), k), rep(0,p-k))
Sigma <- 2*tcrossprod(v1) + diag(p)
mu <- rep(0, p)

X <- mvrnorm(n, mu, Sigma)

v_hat_star <- select_projection(data = 1/n*crossprod(X), cov = TRUE, p, d = k, B = 100)



