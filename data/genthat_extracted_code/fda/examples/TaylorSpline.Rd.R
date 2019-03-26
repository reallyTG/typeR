library(fda)


### Name: TaylorSpline
### Title: Taylor representation of a B-Spline
### Aliases: TaylorSpline TaylorSpline.fd TaylorSpline.fdPar
###   TaylorSpline.fdSmooth
### Keywords: smooth manip

### ** Examples

##
## The simplest b-spline basis:  order 1, degree 0, zero interior knots:
##       a single step function
##
bspl1.1 <- create.bspline.basis(norder=1, breaks=0:1)
# ... jump to pi to check the code
fd.bspl1.1pi <- fd(pi, basisobj=bspl1.1)
bspl1.1pi <- TaylorSpline(fd.bspl1.1pi)
## Don't show: 
bsp1.1ref <- list(knots=0:1, midpoints=0.5,
  coef=array(pi, dim=rep(1, 3), dimnames=list(NULL, 'b0', 'reps 1')),
  deriv=array(pi, dim=rep(1, 3), dimnames=list(NULL, 'D0', 'reps 1')) )
class(bsp1.1ref) <- "Taylor"
stopifnot(all.equal(bspl1.1pi, bsp1.1ref))
## End(Don't show)

##
## Cubic spline:  4  basis functions
##
bspl4 <- create.bspline.basis(nbasis=4)
plot(bspl4)
parab4.5 <- fd(c(3, -1, -1, 3)/3, bspl4)
# = 4*(x-.5)
TaylorSpline(parab4.5)

##
## A more realistic example
##
data(titanium)
#  Cubic spline with 5 interior knots (6 segments)
# do not run this example on CRAN to save test time
#if(!CRAN()){
#titan10 <- with(titanium, curfit.free.knot(x, y))
#(titan10T <- TaylorSpline(titan10) )
#}




