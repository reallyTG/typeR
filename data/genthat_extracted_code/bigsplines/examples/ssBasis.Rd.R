library(bigsplines)


### Name: ssBasis
### Title: Smoothing Spline Basis for Polynomial Splines
### Aliases: ssBasis

### ** Examples

##########   EXAMPLE   ##########

# define function and its derivatives
n <- 500
x <- seq(0, 1, length.out=n)
knots <- seq(0, 1, length=20)
y <- sin(4 * pi * x)
d1y <- 4 * pi * cos(4 * pi * x)
d2y <- - (4 * pi)^2 * sin(4 * pi * x)

# linear smoothing spline
linmat0 <- ssBasis(x, knots, m=1)
lincoef <- pinvsm(crossprod(linmat0$X)) %*% crossprod(linmat0$X, y)
linyhat <- linmat0$X %*% lincoef
linmat1 <- ssBasis(x, knots, m=1, d=1)
linyd1 <- linmat1$X %*% lincoef

# plot linear smoothing spline results
par(mfrow=c(1,2))
plot(x, y, type="l", main="Function")
lines(x, linyhat, lty=2, col="red")
plot(x, d1y, type="l", main="First Derivative")
lines(x, linyd1, lty=2, col="red")

# cubic smoothing spline
cubmat0 <- ssBasis(x, knots)
cubcoef <- pinvsm(crossprod(cubmat0$X)) %*% crossprod(cubmat0$X, y)
cubyhat <- cubmat0$X %*% cubcoef
cubmat1 <- ssBasis(x, knots, d=1)
cubyd1 <- cubmat1$X %*% cubcoef
cubmat2 <- ssBasis(x, knots, d=2)
cubyd2 <- cubmat2$X %*% cubcoef

# plot cubic smoothing spline results
par(mfrow=c(1,3))
plot(x, y, type="l", main="Function")
lines(x, cubyhat, lty=2, col="red")
plot(x, d1y, type="l", main="First Derivative")
lines(x, cubyd1, lty=2, col="red")
plot(x, d2y, type="l", main="Second Derivative")
lines(x, cubyd2, lty=2, col="red")

# quintic smoothing spline
quimat0 <- ssBasis(x, knots, m=3)
quicoef <- pinvsm(crossprod(quimat0$X)) %*% crossprod(quimat0$X, y)
quiyhat <- quimat0$X %*% quicoef
quimat1 <- ssBasis(x, knots, m=3, d=1)
quiyd1 <- quimat1$X %*% quicoef
quimat2 <- ssBasis(x, knots, m=3, d=2)
quiyd2 <- quimat2$X %*% quicoef

# plot quintic smoothing spline results
par(mfrow=c(1,3))
plot(x, y, type="l", main="Function")
lines(x, quiyhat, lty=2, col="red")
plot(x, d1y, type="l", main="First Derivative")
lines(x, quiyd1, lty=2, col="red")
plot(x, d2y, type="l", main="Second Derivative")
lines(x, quiyd2, lty=2, col="red")




