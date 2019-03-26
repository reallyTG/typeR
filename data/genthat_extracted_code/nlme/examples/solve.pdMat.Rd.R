library(nlme)


### Name: solve.pdMat
### Title: Calculate Inverse of a Positive-Definite Matrix
### Aliases: solve.pdMat solve.pdBlocked solve.pdDiag solve.pdIdent
###   solve.pdLogChol solve.pdNatural solve.pdSymm
### Keywords: models

### ** Examples

pd1 <- pdCompSymm(3 * diag(3) + 1)
solve(pd1)



