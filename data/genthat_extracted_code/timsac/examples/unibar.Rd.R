library(timsac)


### Name: unibar
### Title: Univariate Bayesian Method of AR Model Fitting
### Aliases: unibar
### Keywords: ts

### ** Examples

data(Canadianlynx)
z <- unibar(Canadianlynx, ar.order = 20)
z$arcoef



