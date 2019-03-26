library(timsac)


### Name: blocar
### Title: Bayesian Method of Locally Stationary AR Model Fitting; Scalar
###   Case
### Aliases: blocar
### Keywords: ts

### ** Examples

data(locarData)
z <- blocar(locarData, max.order = 10, span = 300)
z$arcoef



