library(fda)


### Name: plot.basisfd
### Title: Plot a Basis Object
### Aliases: plot.basisfd
### Keywords: smooth

### ** Examples

##
## 1.  b-spline
##
# set up the b-spline basis for the lip data, using 23 basis functions,
#   order 4 (cubic), and equally spaced knots.
#  There will be 23 - 4 = 19 interior knots at 0.05, ..., 0.95
lipbasis <- create.bspline.basis(c(0,1), 23)
# plot the basis functions
plot(lipbasis)

##
## 2.  Fourier basis
##
yearbasis3 <- create.fourier.basis(c(0,365),
                    axes=list("axesIntervals") )
#  plot the basis
plot(yearbasis3)

##
## 3.  With Date and POSIXct rangeval
##
# Date
July4.1776 <- as.Date('1776-07-04')
Apr30.1789 <- as.Date('1789-04-30')
AmRev <- c(July4.1776, Apr30.1789)
BspRevolution <- create.bspline.basis(AmRev)
plot(BspRevolution)

# POSIXct
July4.1776ct <- as.POSIXct1970('1776-07-04')
Apr30.1789ct <- as.POSIXct1970('1789-04-30')
AmRev.ct <- c(July4.1776ct, Apr30.1789ct)
BspRev.ct <- create.bspline.basis(AmRev.ct)
plot(BspRev.ct)




