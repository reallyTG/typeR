library(polspline)


### Name: design.polymars
### Title: Polymars: multivariate adaptive polynomial spline regression
### Aliases: design.polymars
### Keywords: smooth nonlinear

### ** Examples

data(state)
state.pm <- polymars(state.region, state.x77, knots = 15, classify = TRUE, gcv = 1)
desmat <- design.polymars(state.pm, state.x77)
# compute traditional summary of the fit for the first class
summary(lm(((state.region=="Northeast")*1) ~ desmat -1))



