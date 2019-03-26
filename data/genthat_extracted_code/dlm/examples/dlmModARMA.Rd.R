library(dlm)


### Name: dlmModARMA
### Title: Create a DLM representation of an ARMA process
### Aliases: dlmModARMA
### Keywords: misc

### ** Examples

## ARMA(2,3)
dlmModARMA(ar = c(.5,.1), ma = c(.4,2,.3), sigma2=1)
## Bivariate ARMA(2,1)
dlmModARMA(ar = list(matrix(1:4,2,2), matrix(101:104,2,2)),
           ma = list(matrix(-4:-1,2,2)), sigma2 = diag(2))



