library(polspline)


### Name: predict.polymars
### Title: Polymars: multivariate adaptive polynomial spline regression
### Aliases: predict.polymars
### Keywords: smooth nonlinear

### ** Examples

data(state)
state.pm <- polymars(state.region, state.x77, knots = 15, classify = TRUE, gcv = 1)
table(predict(state.pm, x = state.x77, classify = TRUE), state.region)



