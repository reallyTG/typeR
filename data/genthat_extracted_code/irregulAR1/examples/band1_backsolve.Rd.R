library(irregulAR1)


### Name: band1_backsolve
### Title: Backsolve with band 1 upper Cholesky.
### Aliases: band1_backsolve

### ** Examples

Q <- ar1_prec_irregular(c(1, 3:4, 6), 0.5, 1)
U <- chol_tridiag_upper(Q)
z <- rnorm(nrow(U))
band1_backsolve(U, z)



