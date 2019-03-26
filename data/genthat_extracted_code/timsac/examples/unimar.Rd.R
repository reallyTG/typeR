library(timsac)


### Name: unimar
### Title: Univariate Case of Minimum AIC Method of AR Model Fitting
### Aliases: unimar
### Keywords: ts

### ** Examples

data(Canadianlynx)
z <- unimar(Canadianlynx, max.order = 20)
z$arcoef



