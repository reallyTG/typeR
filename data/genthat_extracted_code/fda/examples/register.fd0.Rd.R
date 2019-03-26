library(fda)


### Name: register.fd0
### Title: Correct for initial position error between functional data
###   objects.
### Aliases: register.fd0
### Keywords: smooth

### ** Examples

# Specify smoothing weight
lambda.gr2.3 <- .03

# Specify what to smooth, namely the rate of change of curvature
Lfdobj.growth    <- 2

# Establish a B-spline basis
nage <- length(growth$age)
norder.growth <- 6
nbasis.growth <- nage + norder.growth - 2
rng.growth <- range(growth$age)
# 1 18
wbasis.growth <- create.bspline.basis(rangeval=rng.growth,
                   nbasis=nbasis.growth, norder=norder.growth,
                   breaks=growth$age)

# Smooth consistent with the analysis of these data
# in afda-ch06.R, and register to individual smooths:
cvec0.growth <- matrix(0,nbasis.growth,1)
Wfd0.growth  <- fd(cvec0.growth, wbasis.growth)
growfdPar2.3 <- fdPar(Wfd0.growth, Lfdobj.growth, lambda.gr2.3)
# Create a functional data object for all the boys
hgtmfd.all <- with(growth, smooth.basis(age, hgtm, growfdPar2.3))

nBoys <- 2
# nBoys <- dim(growth[["hgtm"]])[2]
# register.fd takes time, so use only 2 curves as an illustration
# to minimize compute time in this example;

#Alternative to subsetting later is to subset now:
#hgtmfd.all<-with(growth,smooth.basis(age, hgtm[,1:nBoys],growfdPar2.3))

# Register the growth velocity rather than the
# growth curves directly
smBv <- deriv(hgtmfd.all$fd, 1)

smB.reg.0 <- register.fd0(smBv[1:nBoys])

op <- par(mfrow=c(3,1))
plot(smBv[1:nBoys])
lines(mean.fd(smBv[1:nBoys]), lty='dotted', col='blue')

plot(smB.reg.0$regfd)
lines(mean.fd(smBv[1:nBoys]), lty='dotted', col='blue')
# Note change of scale.
# The peak of smBv[2] at ~15.5
# is pushed off the chart as x0[2]=4.47
plot(smB.reg.0$dregfd)
# looks OK
par(op)




