library(SPCAvRP)


### Name: SPCAvRP_deflation
### Title: Computes the leading eigenvectors using the modified deflation
###   scheme
### Aliases: SPCAvRP_deflation

### ** Examples

p <- 50
k <- 8
theta <- 40
v1 <- c(rep(1/sqrt(k), k), rep(0, p-k))
theta2 <- 20
v2 <- c(rep(0,4), 1/sqrt(k), -1/sqrt(k), 1/sqrt(k), -1/sqrt(k), rep(1/sqrt(k),4), rep(0,p-12))
theta3 <- 5
v3 <- c(rep(0,6), 1/sqrt(k), -rep(1/sqrt(k),4), rep(1/sqrt(k),3), rep(0,p-14))
Sigma <- diag(p) + theta*tcrossprod(v1) + (theta2)*tcrossprod(v2) + (theta3)*tcrossprod(v3) 
mu <- rep(0, p)
n <- 2000
X <- mvrnorm(n, mu, Sigma)

spcarp <- SPCAvRP_deflation(data = X, cov = FALSE, s = 1, l = k, d = k, 
                            A = 300, B = 100, center_data = FALSE)



