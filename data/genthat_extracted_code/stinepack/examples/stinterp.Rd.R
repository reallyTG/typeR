library(stinepack)


### Name: stinterp
### Title: A consistently well behaved method of interpolation
### Aliases: stinterp
### Keywords: math ts smooth

### ** Examples

## Interpolation with rational functions
#This example shows how the rational interpolating functions used in
#`stinterp' have a monotonic slope over an interval with widely varying
#slopes specified at the end points, consistent with Stineman's
#requirements above. A third degree interpolating function (commonly
#used in spline interpolation), on the other hand, leads to
#spurious oscillations, which are a well known problem in
#interpolation with a single polynomial function and also
#in piecewise polynomial interpolation.
## Not run: 
##D xo <- seq(0,1,by=1/50)
##D plot(c(0,1),c(0,1),xlim=c(0,1),ylim=c(-1,1),xlab="",ylab="")
##D for (s in 2:10) {
##D lines(stinterp(c(0,1),c(0,1),xo,yp=c(0,s)))
##D lines(xo,xo^2*((s-2)*xo-s+3),col=2) }
## End(Not run)
#Note that the two interpolation functions almost coincide for the
#lowest value (s=2) of the slope at the right end point.
#The user may verify that the rational interpolating functions continue
#to provide "reasonable" results for much higher values of the slope at the
#right end point (for example s=15, s=25 or s=100), for which the third degree
#polynomial leads to absurd results (for most practical purposes).

## Interpolate a smooth curve
#This example illustrates that the interpolation procedure
#reproduces a smooth function with known slopes at the specified
#points very well. If the slopes are not known, both methods for
#estimating the slopes at the specified points (the default method
#and method="parabola") lead to good interpolating functions, but
#the "parabola" method is slightly more accurate. The traditional 
#spline interpolation method leads to a similar result as Stineman's 
#method with slopes computed with method="parabola".
x <- seq(0,2*pi,by=pi/6)
y <- sin(x)
yp <- cos(x)
xo <- seq(0,2*pi,by=pi/150)
y1 <- stinterp(x,y,xo,yp)$y
y2 <- stinterp(x,y,xo)$y
y3 <- stinterp(x,y,xo,m="pa")$y
## Not run: 
##D plot(x,y)
##D lines(xo,sin(xo))
##D points(stinterp(x,y,xo,yp),cex=1/5,col=2)
##D points(stinterp(x,y,xo),cex=1/5,col=3)
##D points(stinterp(x,y,xo,method="parabola"),cex=1/5,col=4)
##D points(spline(x,y,n=length(xo)),cex=1/5,col=5)
## End(Not run)

## Interpolate through a sharp oscillation
#This example shows that Stineman's interpolation, with the default
#method for estimating slopes at the given points, results in no oscillations
#in the neighbourhood of a spike. If the slopes at the given points are
#computed with method="parabola", some overshooting can be seen and
#spline interpolation leads to repeated oscillations near the spike.
## Not run: 
##D yy <- y
##D yy[3] <- -1.5
##D plot(x,yy,ylim=c(-1.5,1.5))
##D points(stinterp(x,yy,xo),cex=1/5,col=3)
##D points(stinterp(x,yy,xo,method="parabola"),cex=1/5,col=4)
##D points(spline(x,yy,n=length(xo)),cex=1/5,col=5)
## End(Not run)



