library(timsac)


### Name: exsar
### Title: Exact Maximum Likelihood Method of Scalar AR Model Fitting
### Aliases: exsar
### Keywords: ts

### ** Examples

data(Canadianlynx)
z <- exsar(Canadianlynx, max.order = 14)
z$arcoef.maice
z$arcoef.mle



