library(fda)


### Name: create.bspline.basis
### Title: Create a B-spline Basis
### Aliases: create.bspline.basis create.bspline.irregular
### Keywords: smooth

### ** Examples

##
## The simplest basis currently available with this function:
##
bspl1.1 <- create.bspline.basis(norder=1)
plot(bspl1.1)
# 1 basis function, order 1 = degree 0 = step function:

# should be the same as above:
b1.1 <- create.bspline.basis(0:1, nbasis=1, norder=1, breaks=0:1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bspl1.1, b1.1)
## Don't show: 
)
## End(Don't show)

bspl2.2 <- create.bspline.basis(norder=2)
plot(bspl2.2)

bspl3.3 <- create.bspline.basis(norder=3)
plot(bspl3.3)

bspl4.4 <- create.bspline.basis()
plot(bspl4.4)

bspl1.2 <- create.bspline.basis(norder=1, breaks=c(0,.5, 1))
plot(bspl1.2)
# 2 bases, order 1 = degree 0 = step functions:
# (1) constant 1 between 0 and 0.5 and 0 otherwise
# (2) constant 1 between 0.5 and 1 and 0 otherwise.

bspl2.3 <- create.bspline.basis(norder=2, breaks=c(0,.5, 1))
plot(bspl2.3)
# 3 bases:  order 2 = degree 1 = linear
# (1) line from (0,1) down to (0.5, 0), 0 after
# (2) line from (0,0) up to (0.5, 1), then down to (1,0)
# (3) 0 to (0.5, 0) then up to (1,1).

bspl3.4 <- create.bspline.basis(norder=3, breaks=c(0,.5, 1))
plot(bspl3.4)
# 4 bases:  order 3 = degree 2 = parabolas.
# (1) (x-.5)^2 from 0 to .5, 0 after
# (2) 2*(x-1)^2 from .5 to 1, and a parabola
#     from (0,0 to (.5, .5) to match
# (3 & 4) = complements to (2 & 1).

bSpl4. <- create.bspline.basis(c(-1,1))
plot(bSpl4.)
# Same as bSpl4.23 but over (-1,1) rather than (0,1).

# set up the b-spline basis for the lip data, using 23 basis functions,
#   order 4 (cubic), and equally spaced knots.
#  There will be 23 - 4 = 19 interior knots at 0.05, ..., 0.95
lipbasis <- create.bspline.basis(c(0,1), 23)
plot(lipbasis)

bSpl.growth <- create.bspline.basis(growth$age)
# cubic spline (order 4)

bSpl.growth6 <- create.bspline.basis(growth$age,norder=6)
# quintic spline (order 6)

##
## irregular
##
Time <- c(1:20, 41:60)
Birreg <- create.bspline.irregular(Time)
plot(Birreg)

# check
bks <- quantile(Time, seq(0, 1, length=4))
Bspi <- create.bspline.basis(c(1, 60), nbasis=round(sqrt(40)),
          breaks=bks)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Birreg, Bspi)
## Don't show: 
)
## End(Don't show)

##
## Nonnumeric rangeval
##
# Date
July4.1776 <- as.Date('1776-07-04')
Apr30.1789 <- as.Date('1789-04-30')
AmRev <- c(July4.1776, Apr30.1789)
BspRevolution <- create.bspline.basis(AmRev)

# POSIXct
July4.1776ct <- as.POSIXct1970('1776-07-04')
Apr30.1789ct <- as.POSIXct1970('1789-04-30')
AmRev.ct <- c(July4.1776ct, Apr30.1789ct)
BspRev.ct <- create.bspline.basis(AmRev.ct)




