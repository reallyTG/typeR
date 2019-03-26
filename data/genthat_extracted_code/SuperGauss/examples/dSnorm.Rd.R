library(SuperGauss)


### Name: dSnorm
### Title: Density of a multivariate normal with Toeplitz variance matrix.
### Aliases: dSnorm dSnormDL

### ** Examples

N <- 10
d <- 4
X <- matrix(rnorm(N*d), N, d)
theta <- 0.1
lambda <- 2

mu <- theta^2 * rep(1, N)
acf <- exp(-lambda * (1:N - 1))
acf <- Toeplitz(acf = acf)

dSnorm(X, mu, acf, log = TRUE)



