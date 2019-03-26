library(irregulAR1)


### Name: dprecchol_drho
### Title: Derivative of the upper Cholesky triangle of the precision
###   matrix of a stationary Gaussian AR(1) process.
### Aliases: dprecchol_drho

### ** Examples

library(Matrix)
t <- c(1, 3:4, 6, 8)
r <- 0.5
s <- 1
U <- ar1_prec_chol_irregular(t, r, s)
dQ <- dprec_drho(t, r, s)
(dU <- dprecchol_drho(U, dQ))



