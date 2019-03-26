library(nmfem)


### Name: loglik_mult
### Title: Extract log-likelihood from a mixture of multinomials
### Aliases: loglik_mult

### ** Examples

travelers <- travelers[ ,-1]
M <- ncol(travelers)
K <- 5

Theta0    <- t(dplyr::sample_n(travelers, K))
Theta0    <- Theta0 / matrix(rep(apply(Theta0, 2, sum), M), nrow = M, ncol = K, byrow = TRUE)
travelers <- as.matrix(travelers)
p0        <- rep(1 / K, K)

llh <- loglik_mult(travelers, Theta0, p = p0)
llh




