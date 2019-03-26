library(bigsplines)


### Name: ordspline
### Title: Fits Ordinal Smoothing Spline
### Aliases: ordspline

### ** Examples


##########   EXAMPLE   ##########

# generate some data
n <- 100
nk <- 50
x <- seq(-3,3,length.out=n)
eta <- (sin(2*x/pi) + 0.25*x^3 + 0.05*x^5)/15
set.seed(1)
y <- eta + rnorm(n, sd=0.5)

# plot data and true eta
plot(x, y)
lines(x, eta, col="blue", lwd=2)

# fit ordinal smoothing spline
ossmod <- ordspline(x, y, knots=nk)
lines(ossmod$x, ossmod$fit, col="red", lwd=2)

# fit monotonic smoothing spline
mssmod <- ordspline(x, y, knots=nk, monotone=TRUE)
lines(mssmod$x, mssmod$fit, col="purple", lwd=2)




