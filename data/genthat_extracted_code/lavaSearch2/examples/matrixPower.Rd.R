library(lavaSearch2)


### Name: matrixPower
### Title: Power of a Matrix
### Aliases: matrixPower

### ** Examples

## symmetric matrix
set.seed(10)
M <- matrix(rnorm(20*6),20,6)
Sigma <- var(M)
Sigma.half <- matrixPower(Sigma, power = 1/2, symmetric = TRUE)
round(Sigma.half %*% Sigma.half - Sigma,5)

iSigma <- matrixPower(Sigma, power = -1, symmetric = TRUE)
round(iSigma %*% Sigma,5)

iSigma.half <- matrixPower(Sigma, power = -1/2, symmetric = TRUE)
round(iSigma.half %*% iSigma.half - iSigma,5)

## non symmetric matrix
set.seed(10)
M <- matrix(abs(rnorm(9)), 3, 3) + diag(1,3,3)
M-t(M)

iM <- matrixPower(M, power = -1, symmetric = FALSE)
round(iM %*% M,5)

iM.half <- matrixPower(M, power = -1/2, symmetric = FALSE)
round(iM.half %*% iM.half %*% M,5)




