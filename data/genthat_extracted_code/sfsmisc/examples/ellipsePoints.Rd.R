library(sfsmisc)


### Name: ellipsePoints
### Title: Compute Radially Equispaced Points on Ellipse
### Aliases: ellipsePoints
### Keywords: iplot utilities

### ** Examples

## Simple Ellipse, centered at (0,0), x-/y- axis parallel:
ep <- ellipsePoints(5,2)
str(ep)
plot(ep, type="n",asp=1) ; polygon(ep, col = 2)
## (a,b) = (2,5)  is equivalent to (5,2) :
lines(ellipsePoints(2,5), lwd=2, lty=3)
## keep.order=TRUE : Now, (2,5) are axes in x- respective y- direction:
lines(ellipsePoints(2,5, keep.ab.order=TRUE), col="blue")

## rotate by 30 degrees :
plot(ellipsePoints(5,2, alpha = 30), asp=1)
abline(h=0,v=0,col="gray")
abline(a=0,b= tan( 30 *pi/180), col=2, lty = 2)
abline(a=0,b= tan(120 *pi/180), col=3, lty = 2)

## NB: use x11(type = "Xlib") for the following if you can
if(dev.interactive(TRUE)) {
  ## Movie : rotating ellipse  :
  nTurns <- 4 # #{full 360 deg turns}
  for(al in 1:(nTurns*360)) {
      ep <- ellipsePoints(3,6, alpha=al, loc = c(5,2))
      plot(ep,type="l",xlim=c(-1,11),ylim=c(-4,8),
	   asp=1, axes = FALSE, xlab="", ylab="")
  }

  ## Movie : rotating _filled_ ellipse {less nice to look at}
  for(al in 1:180) {
      ep <- ellipsePoints(3,6, alpha=al, loc = c(5,2))
      plot(ep,type="n",xlim=c(-1,11),ylim=c(-4,8),
	   asp=1, axes = FALSE, xlab="", ylab="")
      polygon(ep,col=2,border=3,lwd=2.5)
  }
}# only if interactive



