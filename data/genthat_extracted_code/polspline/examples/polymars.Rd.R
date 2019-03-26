library(polspline)


### Name: polymars
### Title: Polymars: multivariate adaptive polynomial spline regression
### Aliases: polymars
### Keywords: smooth nonlinear

### ** Examples

data(state)
state.pm <- polymars(state.region, state.x77, knots = 15, classify = TRUE)
state.pm2 <- polymars(state.x77[, 2], state.x77[,-2], gcv = 2)
plot(fitted(state.pm2), residuals(state.pm2))



