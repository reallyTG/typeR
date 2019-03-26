library(polspline)


### Name: plot.polymars
### Title: Polymars: multivariate adaptive polynomial spline regression
### Aliases: plot.polymars
### Keywords: smooth nonlinear

### ** Examples

data(state)
state.pm <- polymars(state.region, state.x77, knots = 15, classify = TRUE, gcv = 1)
plot(state.pm, 3, 4)



