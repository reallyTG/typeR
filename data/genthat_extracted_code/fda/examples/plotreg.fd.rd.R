library(fda)


### Name: plotreg.fd
### Title: Plot the results of the registration of a set of curves
### Aliases: plotreg.fd
### Keywords: smooth

### ** Examples

#  register and plot the angular acceleration of the gait data
gaittime  <- as.numeric(dimnames(gait)[[1]])*20
gaitrange <- c(0,20)
#  set up a fourier basis object
gaitbasis <- create.fourier.basis(gaitrange, nbasis=21)
#  set up a functional parameter object penalizing harmonic acceleration
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
#  register the functions for the first 10 boys
#  argument periodic = TRUE causes register.fd to estimate a horizontal shift
#  for each curve, which is a possibility when the data are periodic
nBoys <- 2 # use only 2 boys to save test time.
#  set up the basis for the warping functions
nwbasis   <- 7
wbasis    <- create.bspline.basis(gaitrange,nwbasis,3)
Warpfd    <- fd(matrix(0,nwbasis,nBoys),wbasis)
WarpfdPar <- fdPar(Warpfd)
#  carry out the continuous registration
gaitreglist <- register.fd(D2gaitmeanfd, D2gaitfd[1:nBoys], WarpfdPar,
                           iterlim=4, periodic=TRUE)
# set iterlim=4 to reduce the compute time;
# this argument may not be needed in many applications.
#  plot the results
plotreg.fd(gaitreglist)
#  display horizonal shift values
print(round(gaitreglist$shift,1))



