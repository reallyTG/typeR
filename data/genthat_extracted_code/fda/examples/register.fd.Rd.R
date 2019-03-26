library(fda)


### Name: register.fd
### Title: Register Functional Data Objects Using a Continuous Criterion
### Aliases: register.fd
### Keywords: smooth

### ** Examples

#See the analyses of the growth data for examples.
##
## 1.  smooth the growth data for the Berkeley boys
##
# Specify smoothing weight
lambda.gr2.3 <- .03
# Specify what to smooth, namely the rate of change of curvature
Lfdobj.growth    <- 2
# Set up a B-spline basis for smoothing the discrete data
nage <- length(growth$age)
norder.growth <- 6
nbasis.growth <- nage + norder.growth - 2
rng.growth <- range(growth$age)
wbasis.growth <- create.bspline.basis(rangeval=rng.growth,
                   nbasis=nbasis.growth, norder=norder.growth,
                   breaks=growth$age)
# Smooth the data
# in afda-ch06.R, and register to individual smooths:
cvec0.growth <- matrix(0,nbasis.growth,1)
Wfd0.growth  <- fd(cvec0.growth, wbasis.growth)
growfdPar2.3 <- fdPar(Wfd0.growth, Lfdobj.growth, lambda.gr2.3)
hgtmfd.all   <- with(growth, smooth.basis(age, hgtm, growfdPar2.3)$fd)
# Register the growth velocity rather than the
# growth curves directly
smBv <- deriv(hgtmfd.all, 1)
##
## 2.  Register the first 2 Berkeley boys using the default basis
##     for the warping function
##
# register.fd takes time, so use only 2 curves as an illustration
# to minimize compute time in these examples
nBoys <- 2
#  Define the target function as the mean of the first nBoys records
smBv0 = mean.fd(smBv[1:nBoys])
#  Register these curves.  The default choice for the functional
#  parameter object WfdParObj is used.
smB.reg.0 <- register.fd(smBv0, smBv[1:nBoys])
#  plot each curve.  Click on the R Graphics window to show each plot.
#  The left panel contains:
#    -- the unregistered curve (dashed blue line)
#    -- the target function (dashed red line)
#    -- the registered curve (solid blue line)
#  The right panel contains:
#    -- the warping function h(t)
#    -- the linear function corresponding to no warping
plotreg.fd(smB.reg.0)
#  Notice that all the warping functions all have simple shapes
#  due to the use of the simplest possible basis
##
## 3.  Define a more flexible basis for the warping functions
##
if(!CRAN()){
Wnbasis   <- 4
Wbasis    <- create.bspline.basis(rng.growth, Wnbasis)
Wfd0      <- fd(matrix(0,Wnbasis,1),Wbasis)
#  set up the functional parameter object using only
#      a light amount smoothing
WfdParobj <- fdPar(Wfd0, Lfdobj=2, lambda=0.01)
#  register the curves
smB.reg.1 <- register.fd(smBv0, smBv[1:nBoys], WfdParobj)
plotreg.fd(smB.reg.1)
#  Notice that now the warping functions can have more complex shapes
##
## 4.  Change the target to the mean of the registered functions ...
##     this should provide a better target for registration
##
smBv1 <- mean.fd(smB.reg.1$regfd)
#  plot the old and the new targets
par(mfrow=c(1,1),ask=FALSE)
plot(smBv1)
lines(smBv0, lty=2)
#  Notice how the new target (solid line) has sharper features and
#  a stronger pubertal growth spurt relative to the old target
#  (dashed line).  Now register to the new target
smB.reg.2 <- register.fd(smBv1, smBv[1:nBoys], WfdParobj)
plotreg.fd(smB.reg.2)
#  Plot the mean of these curves as well as the first and second targets
par(mfrow=c(1,1),ask=FALSE)
plot(mean.fd(smB.reg.2$regfd))
lines(smBv0, lty=2)
lines(smBv1, lty=3)
#  Notice that there is almost no improvement over the age of the
#  pubertal growth spurt, but some further detail added in the
#  pre-pubertal region.  Now register the previously registered
#  functions to the new target.
smB.reg.3 <- register.fd(smBv1, smB.reg.1$regfd, WfdParobj)
plotreg.fd(smB.reg.3)
#  Notice that the warping functions only deviate from the straight line
#  over the pre-pubertal region, and that there are some small adjustments
#  to the registered curves as well over the pre-pubertal region.
##
## 5.  register and plot the angular acceleration of the gait data
##
gaittime  <- as.numeric(dimnames(gait)[[1]])*20
gaitrange <- c(0,20)
#  set up a fourier basis object
gaitbasis <- create.fourier.basis(gaitrange, nbasis=21)
harmaccelLfd <- vec2Lfd(c(0, (2*pi/20)^2, 0), rangeval=gaitrange)
gaitfdPar    <- fdPar(gaitbasis, harmaccelLfd, 1e-2)
#  smooth the data
gaitfd <- smooth.basis(gaittime, gait, gaitfdPar)$fd
#  compute the angular acceleration functional data object
D2gaitfd      <- deriv.fd(gaitfd,2)
names(D2gaitfd$fdnames)[[3]] <- "Angular acceleration"
D2gaitfd$fdnames[[3]] <- c("Hip", "Knee")
#  compute the mean angular acceleration functional data object
D2gaitmeanfd  <- mean.fd(D2gaitfd)
names(D2gaitmeanfd$fdnames)[[3]] <- "Mean angular acceleration"
D2gaitmeanfd$fdnames[[3]] <- c("Hip", "Knee")

#  register the functions for the first 2 boys
#  argument periodic = TRUE causes register.fd to estimate a horizontal shift
#  for each curve, which is a possibility when the data are periodic

#  set up the basis for the warping functions
nwbasis   <- 4
wbasis    <- create.bspline.basis(gaitrange,nwbasis,3)
Warpfd    <- fd(matrix(0,nwbasis,nBoys),wbasis)
WarpfdPar <- fdPar(Warpfd)
#  register the functions
gaitreglist <- register.fd(D2gaitmeanfd, D2gaitfd[1:nBoys], WarpfdPar,
                           periodic=TRUE)
#  plot the results
plotreg.fd(gaitreglist)
#  display horizonal shift values
print(round(gaitreglist$shift,1))
}



