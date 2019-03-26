library(timsac)


### Name: mlocar
### Title: Minimum AIC Method of Locally Stationary AR Model Fitting;
###   Scalar Case
### Aliases: mlocar
### Keywords: ts

### ** Examples

data(locarData)
z <- mlocar(locarData, max.order = 10, span = 300, const = 0)
z$arcoef



