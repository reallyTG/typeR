library(pdSpecEst)


### Name: pdPgram2D
### Title: Multitaper HPD time-varying periodogram matrix
### Aliases: pdPgram2D

### ** Examples

## Coefficient matrices
Phi1 <- array(c(0.4, 0, 0, 0.8, rep(0, 4)), dim = c(2, 2, 2))
Phi2 <- array(c(0.8, 0, 0, 0.4, rep(0, 4)), dim = c(2, 2, 2))
Theta <- array(c(0.5, -0.7, 0.6, 0.8, rep(0, 4)), dim = c(2, 2, 2))
Sigma <- matrix(c(1, 0.71, 0.71, 2), nrow = 2)

## Generate piecewise stationary time series
ts.Phi <- function(Phi) rARMA(2^9, 2, Phi, Theta, Sigma)$X
ts <- rbind(ts.Phi(Phi1), ts.Phi(Phi2))

pgram <- pdPgram2D(ts)




