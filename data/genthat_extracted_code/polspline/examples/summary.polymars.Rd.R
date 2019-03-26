library(polspline)


### Name: summary.polymars
### Title: Polymars: multivariate adaptive polynomial spline regression
### Aliases: summary.polymars print.polymars
### Keywords: smooth nonlinear

### ** Examples

data(state)
state.pm <- polymars(state.region, state.x77, knots = 15, classify = TRUE)
summary(state.pm)



