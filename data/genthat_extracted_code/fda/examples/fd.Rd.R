library(fda)


### Name: fd
### Title: Define a Functional Data Object
### Aliases: fd [.fd
### Keywords: smooth internal

### ** Examples

##
## default
##
fd()

##
## The simplest b-spline basis:  order 1, degree 0, zero interior knots:
##       a single step function
##
bspl1.1 <- create.bspline.basis(norder=1, breaks=0:1)
fd.bspl1.1 <- fd(0, basisobj=bspl1.1)

fd.bspl1.1a <- fd(basisobj=bspl1.1)
## Don't show: 
 stopifnot( 
## End(Don't show)
all.equal(fd.bspl1.1, fd.bspl1.1a)
## Don't show: 
 ) 
## End(Don't show)
# TRUE

## Not run: 
##D fd.bspl1.1b <- fd(0)
##D Error in fd(0) :
##D   Number of coefficients does not match number of basis functions.
##D 
##D ... because fd by default wants to create a cubic spline
## End(Not run)
##
## Cubic spline:  4  basis functions
##
bspl4 <- create.bspline.basis(nbasis=4)
plot(bspl4)
parab4.5 <- fd(c(3, -1, -1, 3)/3, bspl4)
# = 4*(x-.5)^2
plot(parab4.5)

##
## Fourier basis
##
f3 <- fd(c(0,0,1), create.fourier.basis())
plot(f3)
# range over +/-sqrt(2), because
# integral from 0 to 1 of cos^2 = 1/2
# so multiply by sqrt(2) to get
# its square to integrate to 1.

##
## subset of an fd object
##
gaitbasis3 <- create.fourier.basis(nbasis=5)
gaitfd3    <- Data2fd(gait, basisobj=gaitbasis3)
gaitfd3[1]




