library(oce)


### Name: lowpass
### Title: Perform lowpass digital filtering
### Aliases: lowpass

### ** Examples


library(oce)
par(mfrow=c(1, 2), mar=c(4, 4, 1, 1))
coef <- lowpass(n=5, coefficients=TRUE)
plot(-2:2, coef, ylim=c(0, 1), xlab="Lag", ylab="Coefficient")
x <- seq(-5, 5) + rnorm(11)
plot(1:11, x, type='o', xlab="time", ylab="x and X")
X <- lowpass(x, n=5)
lines(1:11, X, col=2)
points(1:11, X, col=2)



