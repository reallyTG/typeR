library(fda)


### Name: as.fd
### Title: Convert a spline object to class 'fd'
### Aliases: as.fd as.fd.fdSmooth as.fd.function as.fd.smooth.spline
### Keywords: smooth manip

### ** Examples

##
## as.fd.fdSmooth
##
girlGrowthSm <- with(growth, smooth.basisPar(argvals=age, y=hgtf,
                                             lambda=0.1))
girlGrowth.fd <- as.fd(girlGrowthSm)

##
## as.fd.function(splinefun(...), ...)
##
x2 <- 1:7
y2 <- sin((x2-0.5)*pi)
f <- splinefun(x2, y2)
fd. <- as.fd(f)
x. <- seq(1, 7, .02)
fx. <- f(x.)
fdx. <- eval.fd(x., fd.)

# range(y2, fx., fdx.) generates an error 2012.04.22

rfdx <- range(fdx.)

plot(range(x2), range(y2, fx., rfdx), type='n')
points(x2, y2)
lines(x., sin((x.-0.5)*pi), lty='dashed')
lines(x., f(x.), col='blue')
lines(x., eval.fd(x., fd.), col='red', lwd=3, lty='dashed')
# splinefun and as.fd(splineful(...)) are close
# but quite different from the actual function
# apart from the actual 7 points fitted,
# which are fitted exactly
# ... and there is no information in the data
# to support a better fit!

# Translate also a natural spline
fn <- splinefun(x2, y2, method='natural')
fn. <- as.fd(fn)
lines(x., fn(x.), lty='dotted', col='blue')
lines(x., eval.fd(x., fn.), col='green', lty='dotted', lwd=3)

## Not run: 
##D # Will NOT translate a periodic spline
##D fp <- splinefun(x, y, method='periodic')
##D as.fd(fp)
##D #Error in as.fd.function(fp) :
##D #  x (fp)  uses periodic B-splines, and as.fd is programmed
##D #   to translate only B-splines with coincident boundary knots.
##D 
## End(Not run)

##
## as.fd.smooth.spline
##
cars.spl <- with(cars, smooth.spline(speed, dist))
cars.fd <- as.fd(cars.spl)

plot(dist~speed, cars)
lines(cars.spl)
sp. <- with(cars, seq(min(speed), max(speed), len=101))
d. <- eval.fd(sp., cars.fd)
lines(sp., d., lty=2, col='red', lwd=3)



