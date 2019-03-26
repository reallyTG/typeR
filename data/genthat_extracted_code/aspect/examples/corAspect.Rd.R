library(aspect)


### Name: corAspect
### Title: Scaling by Maximizing Correlational Aspects
### Aliases: corAspect print.aspect summary.aspect
### Keywords: models

### ** Examples


## maximizes the first eigenvalue
data(galo)
res.eig1 <- corAspect(galo[,1:4], aspect = "aspectEigen")
res.eig1
summary(res.eig1)

## maximizes the first 2 eigenvalues
res.eig2 <- corAspect(galo[,1:4], aspect = "aspectEigen", p = 2)
res.eig2

## maximizes the absolute value of cubic correlations
res.abs3 <- corAspect(galo[,1:4], aspect = "aspectAbs", pow = 3)
res.abs3

## maximizes the sum of squared correlations
res.cor2 <- corAspect(galo[,1:4], aspect = "aspectSum", pow = 2)
res.cor2

## maximizes the determinant
res.det <- corAspect(galo[,1:4], aspect = "aspectDeterminant")
res.det

## maximizes SMC, IQ as target variable
res.smc <- corAspect(galo[,1:4], aspect = "aspectSMC", targvar = 2)
res.smc

## maximizes the sum of SMC
res.sumsmc <- corAspect(galo[,1:4], aspect = "aspectSumSMC")
res.sumsmc

## some user-defined non-sense aspect
## first list element corresponds to function value, second to first derivative
myAspect <- function(r, a = 1, b = 1) list(a*b*r, matrix(a*b, nrow = nrow(r), ncol = ncol(r)))
res.my <- corAspect(galo[,1:4], aspect = myAspect, a = 2, b = 4)
res.my






