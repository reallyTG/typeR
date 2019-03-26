library(fda)


### Name: eval.fd
### Title: Values of a Functional Data Object
### Aliases: eval.fd predict.fd predict.fdPar predict.fdSmooth
###   fitted.fdSmooth residuals.fdSmooth
### Keywords: smooth

### ** Examples

##
## eval.fd
##
#    set up the fourier basis
daybasis <- create.fourier.basis(c(0, 365), nbasis=65)
#  Make temperature fd object
#  Temperature data are in 12 by 365 matrix tempav
#  See analyses of weather data.
#  Set up sampling points at mid days
#  Convert the data to a functional data object
tempfd <- smooth.basis(day.5,  CanadianWeather$dailyAv[,,"Temperature.C"],
                       daybasis)$fd
#   set up the harmonic acceleration operator
Lbasis  <- create.constant.basis(c(0, 365))
Lcoef   <- matrix(c(0,(2*pi/365)^2,0),1,3)
bfdobj  <- fd(Lcoef,Lbasis)
bwtlist <- fd2list(bfdobj)
harmaccelLfd <- Lfd(3, bwtlist)
#   evaluate the value of the harmonic acceleration
#   operator at the sampling points
Ltempmat <- eval.fd(day.5, tempfd, harmaccelLfd)

#  Confirm that it still works with
#  evalarg = a matrix with only one column
#  when fdobj[['coefs']] is a matrix with multiple columns

Ltempmat. <- eval.fd(matrix(day.5, ncol=1), tempfd, harmaccelLfd)
#  confirm that the two answers are the same

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Ltempmat, Ltempmat.)
## Don't show: 
)
## End(Don't show)

#  Plot the values of this operator
matplot(day.5, Ltempmat, type="l")

##
## predict.fd
##
predict(tempfd) # end points only at 35 locations
str(predict(tempfd, day.5)) # 365 x 35 matrix
str(predict(tempfd, day.5, harmaccelLfd))

# cublic splie with knots at 0, .5, 1
bspl3 <- create.bspline.basis(c(0, .5, 1))
plot(bspl3) # 5 bases
fd.bspl3 <- fd(c(0, 0, 1, 0, 0), bspl3)
pred3 <- predict(fd.bspl3)

pred3. <- matrix(c(0, .5, 0), 3)
dimnames(pred3.) <- list(NULL, 'reps 1')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(pred3, pred3.)
## Don't show: 
)
## End(Don't show)

pred.2 <- predict(fd.bspl3, c(.2, .8))

pred.2. <- matrix(.176, 2, 1)
dimnames(pred.2.) <- list(NULL, 'reps 1')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(pred.2, pred.2.)
## Don't show: 
)
## End(Don't show)

##
## predict.fdSmooth
##
lipSm9 <- smooth.basisPar(liptime, lip, lambda=1e-9)$fd
plot(lipSm9)

##
## with evalarg of class Date and POSIXct
##
# Date
July4.1776 <- as.Date('1776-07-04')
Apr30.1789 <- as.Date('1789-04-30')
AmRev <- c(July4.1776, Apr30.1789)
BspRevolution <- create.bspline.basis(AmRev)

AmRevYears <- seq(July4.1776, Apr30.1789, length.out=14)
(AmRevLinear <- as.numeric(AmRevYears-July4.1776))
fitLin <- smooth.basis(AmRevYears, AmRevLinear, BspRevolution)
AmPred <- predict(fitLin, AmRevYears)

# POSIXct
AmRev.ct <- as.POSIXct1970(c('1776-07-04', '1789-04-30'))
BspRev.ct <- create.bspline.basis(AmRev.ct)
AmRevYrs.ct <- seq(AmRev.ct[1], AmRev.ct[2], length.out=14)
(AmRevLin.ct <- as.numeric(AmRevYrs.ct-AmRev.ct[2]))
fitLin.ct <- smooth.basis(AmRevYrs.ct, AmRevLin.ct, BspRev.ct)
AmPred.ct <- predict(fitLin.ct, AmRevYrs.ct)




