library(fda)


### Name: bsplinepen
### Title: B-Spline Penalty Matrix
### Aliases: bsplinepen
### Keywords: smooth

### ** Examples

##
## bsplinepen with only one basis function
##
bspl1.1 <- create.bspline.basis(nbasis=1, norder=1)
pen1.1 <- bsplinepen(bspl1.1, 0)

##
## bspline pen for a cubic spline with knots at seq(0, 1, .1)
##
basisobj <- create.bspline.basis(c(0,1),13)
#  compute the 13 by 13 matrix of inner products of second derivatives
penmat <- bsplinepen(basisobj)

##
## with rng of class Date or POSIXct
##
# Date
invasion1 <- as.Date('1775-09-04')
invasion2 <- as.Date('1812-07-12')
earlyUS.Canada <- c(invasion1, invasion2)
BspInvade1 <- create.bspline.basis(earlyUS.Canada)
Binvadmat <- bsplinepen(BspInvade1)

# POSIXct
AmRev.ct <- as.POSIXct1970(c('1776-07-04', '1789-04-30'))
BspRev1.ct <- create.bspline.basis(AmRev.ct)
Brevmat <- bsplinepen(BspRev1.ct)




