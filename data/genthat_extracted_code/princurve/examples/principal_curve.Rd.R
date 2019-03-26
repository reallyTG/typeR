library(princurve)


### Name: principal_curve
### Title: Fit a Principal Curve
### Aliases: principal_curve lines.principal_curve plot.principal_curve
###   points.principal_curve whiskers
### Keywords: nonparametric regression smooth

### ** Examples

x <- runif(100,-1,1)
x <- cbind(x, x ^ 2 + rnorm(100, sd = 0.1))
fit <- principal_curve(x)
plot(fit)
lines(fit)
points(fit)
whiskers(x, fit$s)



