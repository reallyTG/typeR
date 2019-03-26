library(fda)


### Name: Data2fd
### Title: Create a functional data object from data
### Aliases: Data2fd
### Keywords: smooth

### ** Examples

##
## Simplest possible example:  constant function
##
# 1 basis, order 1 = degree 0 = constant function
b1.1 <- create.bspline.basis(nbasis=1, norder=1)
# data values: 1 and 2, with a mean of 1.5
y12 <- 1:2
# smooth data, giving a constant function with value 1.5
fd1.1 <- Data2fd(y12, basisobj=b1.1)
plot(fd1.1)
# now repeat the analysis with some smoothing, which moves the
# toward 0.
fd1.1.5 <- Data2fd(y12, basisobj=b1.1, lambda=0.5)
#  values of the smooth:
# fd1.1.5 = sum(y12)/(n+lambda*integral(over arg=0 to 1 of 1))
#         = 3 / (2+0.5) = 1.2
eval.fd(seq(0, 1, .2), fd1.1.5)

##
## step function smoothing
##
sessionInfo()
find("crossprod")

# 2 step basis functions: order 1 = degree 0 = step functions
b1.2 <- create.bspline.basis(nbasis=2, norder=1)
#  fit the data without smoothing
fd1.2 <- Data2fd(1:2, basisobj=b1.2)
# plot the result:  A step function:  1 to 0.5, then 2
op <- par(mfrow=c(2,1))
plot(b1.2, main='bases')
plot(fd1.2, main='fit')
par(op)

##
## Simple oversmoothing
##
# 3 step basis functions: order 1 = degree 0 = step functions
b1.3 <- create.bspline.basis(nbasis=3, norder=1)
#  smooth the data with smoothing
fd1.3.5 <- Data2fd(y12, basisobj=b1.3, lambda=0.5)
#  plot the fit along with the points
plot(0:1, c(0, 2), type='n')
points(0:1, y12)
lines(fd1.3.5)
# Fit = penalized least squares with penalty =
#          = lambda * integral(0:1 of basis^2),
#            which shrinks the points towards 0.
# X1.3 = matrix(c(1,0, 0,0, 0,1), 2)
# XtX = crossprod(X1.3) = diag(c(1, 0, 1))
# penmat = diag(3)/3
#        = 3x3 matrix of integral(over arg=0:1 of basis[i]*basis[j])
# Xt.y = crossprod(X1.3, y12) = c(1, 0, 2)
# XtX + lambda*penmat = diag(c(7, 1, 7)/6
# so coef(fd1.3.5) = solve(XtX + lambda*penmat, Xt.y)
#                  = c(6/7, 0, 12/7)

##
## linear spline fit
##
# 3 bases, order 2 = degree 1
b2.3 <- create.bspline.basis(norder=2, breaks=c(0, .5, 1))
# interpolate the values 0, 2, 1
fd2.3 <- Data2fd(c(0,2,1), basisobj=b2.3, lambda=0)
#  display the coefficients
round(fd2.3$coefs, 4)
# plot the results
op <- par(mfrow=c(2,1))
plot(b2.3, main='bases')
plot(fd2.3, main='fit')
par(op)
# apply some smoothing
fd2.3. <- Data2fd(c(0,2,1), basisobj=b2.3, lambda=1)
op <- par(mfrow=c(2,1))
plot(b2.3, main='bases')
plot(fd2.3., main='fit', ylim=c(0,2))
par(op)

##
## quadratic spline fit
##
# 4 bases, order 3 = degree 2 = continuous, bounded, locally quadratic
b3.4 <- create.bspline.basis(norder=3, breaks=c(0, .5, 1))
# fit values c(0,4,2,3) without interpolation
fd3.4 <- Data2fd(c(0,4,2,3), basisobj=b3.4, lambda=0)
round(fd3.4$coefs, 4)
op <- par(mfrow=c(2,1))
plot(b3.4)
plot(fd3.4)
points(c(0,1/3,2/3,1), c(0,4,2,3))
par(op)
#  try smoothing
fd3.4. <- Data2fd(c(0,4,2,3), basisobj=b3.4, lambda=1)
round(fd3.4.$coef, 4)
op <- par(mfrow=c(2,1))
plot(b3.4)
plot(fd3.4., ylim=c(0,4))
points(seq(0,1,len=4), c(0,4,2,3))
par(op)

##
##  Two simple Fourier examples
##
gaitbasis3 <- create.fourier.basis(nbasis=5)
gaitfd3    <- Data2fd(gait, basisobj=gaitbasis3)
plotfit.fd(gait, seq(0,1,len=20), gaitfd3)
#    set up the fourier basis
daybasis <- create.fourier.basis(c(0, 365), nbasis=65)
#  Make temperature fd object
#  Temperature data are in 12 by 365 matrix tempav
#    See analyses of weather data.
tempfd <- Data2fd(CanadianWeather$dailyAv[,,"Temperature.C"],
                  day.5, daybasis)
#  plot the temperature curves
par(mfrow=c(1,1))
plot(tempfd)

##
## argvals of class Date and POSIXct
##
#  Date
invasion1 <- as.Date('1775-09-04')
invasion2 <- as.Date('1812-07-12')
earlyUS.Canada <- c(invasion1, invasion2)
BspInvasion <- create.bspline.basis(earlyUS.Canada)

earlyYears <- seq(invasion1, invasion2, length.out=7)
(earlyQuad <- (as.numeric(earlyYears-invasion1)/365.24)^2)
fitQuad <- Data2fd(earlyYears, earlyQuad, BspInvasion)

# POSIXct
AmRev.ct <- as.POSIXct1970(c('1776-07-04', '1789-04-30'))
BspRev.ct <- create.bspline.basis(AmRev.ct)
AmRevYrs.ct <- seq(AmRev.ct[1], AmRev.ct[2], length.out=14)
(AmRevLin.ct <- as.numeric(AmRevYrs.ct-AmRev.ct[1]))
fitLin.ct <- Data2fd(AmRevYrs.ct, AmRevLin.ct, BspRev.ct)




