library(ContaminatedMixt)


### Name: dCN
### Title: Multivariate Contaminated Normal Distribution
### Aliases: dCN rCN

### ** Examples


point <- c(0,0,0)
mu <- c(1,-2,3)
Sigma <- diag(3)
alpha <- 0.8
eta <- 5
f <- dCN(point, mu, Sigma, alpha, eta)
x <- rCN(10, mu, Sigma, alpha, eta)




