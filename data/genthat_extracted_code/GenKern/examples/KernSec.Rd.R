library(GenKern)


### Name: KernSec
### Title: Univariate kernel density estimate
### Aliases: KernSec
### Keywords: distribution smooth

### ** Examples

x <- c(2,4,6,8,10) 

z <- KernSec(x)				# simplest invocation
plot(z$xords, z$yden, type="l")

z <- KernSec(x, xbandwidth=2, range.x=c(0,8))
plot(z$xords, z$yden, type="l")

# local bandwidths
ords <- seq(from=0, to=14, length=100)
bands <- x/15
z <- KernSec(x, xbandwidth=bands, range.x=ords)
plot(z$xords, z$yden, type="l")         # should plot a wriggly line

bands <- seq(from=1, to=4, length=100)	# improvise a pilot estimate
z <- KernSec(x, xbandwidth=bands, range.x=ords)
plot(z$xords, z$yden, type="l") 



