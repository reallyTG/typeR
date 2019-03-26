library(timsac)


### Name: bsubst
### Title: Bayesian Type All Subset Analysis
### Aliases: bsubst
### Keywords: ts

### ** Examples

data(Canadianlynx)
Regressor <- matrix(
     c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 1, 3, 1, 2, 3,
        0, 0, 0, 0, 0, 0, 0, 0, 0,  0,  0,  0, 1, 2, 2, 3, 1, 2, 3,
        0, 0, 0, 0, 0, 0, 0, 0, 0,  0,  0,  0, 0, 0, 0, 0, 1, 2, 3 ),
     nrow = 3, ncol = 19, byrow = TRUE)
z <- bsubst(Canadianlynx, mtype = 2, lag = 12, nreg = 19, Regressor)
z$arcoef.bay



