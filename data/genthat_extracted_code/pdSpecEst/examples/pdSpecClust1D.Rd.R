library(pdSpecEst)


### Name: pdSpecClust1D
### Title: Intrinsic wavelet HPD spectral matrix clustering
### Aliases: pdSpecClust1D

### ** Examples

## ARMA(1,1) process: Example 11.4.1 in (Brockwell and Davis, 1991)
Phi1 <- array(c(0.5, 0, 0, 0.6, rep(0, 4)), dim = c(2, 2, 2))
Phi2 <- array(c(0.7, 0, 0, 0.4, rep(0, 4)), dim = c(2, 2, 2))
Theta <- array(c(0.5, -0.7, 0.6, 0.8, rep(0, 4)), dim = c(2, 2, 2))
Sigma <- matrix(c(1, 0.71, 0.71, 2), nrow = 2)

## Generate periodogram data for 10 subjects in 2 groups
pgram <- function(Phi) pdPgram(rARMA(2^9, 2, Phi, Theta, Sigma)$X)$P
P <- array(c(replicate(5, pgram(Phi1)), replicate(5, pgram(Phi2))), dim=c(2,2,2^8,10))

cl <- pdSpecClust1D(P, K = 2, metric = "logEuclidean")




