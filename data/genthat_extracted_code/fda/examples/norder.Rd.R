library(fda)


### Name: norder
### Title: Order of a B-spline
### Aliases: norder norder.fd norder.basisfd norder.default norder.bspline
### Keywords: smooth

### ** Examples

bspl1.1 <- create.bspline.basis(norder=1, breaks=0:1)

stopifnot(norder(bspl1.1)==1)

stopifnot(norder(fd(0, basisobj=bspl1.1))==1)

stopifnot(norder(fd(rep(0,4)))==4)

stopifnot(norder(list(fd(rep(0,4))))==4)
## Not run: 
##D norder(list(list(fd(rep(0,4)))))
##D Error in norder.default(list(list(fd(rep(0, 4))))) :
##D   input is not a 'basisfd' object and does not have a 'basisfd'
##D component.
## End(Not run)

stopifnot(norder(create.bspline.basis(norder=1, breaks=c(0,.5, 1))) == 1)

stopifnot(norder(create.bspline.basis(norder=2, breaks=c(0,.5, 1))) == 2)

# Defaut B-spline basis:  Cubic spline:  degree 3, order 4,
# 21 breaks, 19 interior knots.
stopifnot(norder(create.bspline.basis()) == 4)

## Not run: 
##D norder(create.fourier.basis(c(0,12) ))
##D Error in norder.bspline(x) :
##D   object x is of type = fourier;  'norder' is only defined for type = 'bsline'
## End(Not run)




