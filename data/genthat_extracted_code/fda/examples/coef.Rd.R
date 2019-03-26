library(fda)


### Name: coef.fd
### Title: Extract functional coefficients
### Aliases: coef.fd coef.fdPar coef.fdSmooth coef.Taylor coefficients.fd
###   coefficients.fdPar coefficients.fdSmooth coefficients.Taylor
### Keywords: utilities

### ** Examples

##
## coef.fd
##
bspl1.1 <- create.bspline.basis(norder=1, breaks=0:1)
fd.bspl1.1 <- fd(0, basisobj=bspl1.1)
coef(fd.bspl1.1)
## Don't show: 
stopifnot(all.equal(coef(fd.bspl1.1), coefficients(fd.bspl1.1)))
## End(Don't show)

##
## coef.fdPar 
##
rangeval <- c(-3,3)
#  set up some standard normal data
x <- rnorm(50)
#  make sure values within the range
x[x < -3] <- -2.99
x[x >  3] <-  2.99
#  set up basis for W(x)
basisobj <- create.bspline.basis(rangeval, 11)
#  set up initial value for Wfdobj
Wfd0 <- fd(matrix(0,11,1), basisobj)
WfdParobj <- fdPar(Wfd0)

coef(WfdParobj)
## Don't show: 
stopifnot(all.equal(coef(WfdParobj), coefficients(WfdParobj)))
## End(Don't show)

##
## coef.fdSmooth
##

girlGrowthSm <- with(growth, smooth.basisPar(argvals=age, y=hgtf, 
                                             lambda=0.1)$fd)
coef(girlGrowthSm)
## Don't show: 
stopifnot(
all.equal(coef(girlGrowthSm), coefficients(girlGrowthSm)) 
)
## End(Don't show)

##
## coef.Taylor 
##
# coming soon.




