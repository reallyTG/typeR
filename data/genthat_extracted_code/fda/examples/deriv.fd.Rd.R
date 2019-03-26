library(fda)


### Name: deriv.fd
### Title: Compute a Derivative of a Functional Data Object
### Aliases: deriv.fd
### Keywords: smooth

### ** Examples


#  Estimate the acceleration functions for growth curves
#  See the analyses of the growth data.
#  Set up the ages of height measurements for Berkeley data
age <- c( seq(1, 2, 0.25), seq(3, 8, 1), seq(8.5, 18, 0.5))
#  Range of observations
rng <- c(1,18)
#  Set up a B-spline basis of order 6 with knots at ages
knots  <- age
norder <- 6
nbasis <- length(knots) + norder - 2
hgtbasis <- create.bspline.basis(rng, nbasis, norder, knots)
#  Set up a functional parameter object for estimating
#  growth curves.  The 4th derivative is penalyzed to
#  ensure a smooth 2nd derivative or acceleration.
Lfdobj <- 4
lambda <- 10^(-0.5)   #  This value known in advance.
growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)
#  Smooth the data.  The data for the boys and girls
#  are in matrices hgtm and hgtf, respectively.
hgtmfd <- smooth.basis(age, growth$hgtm, growfdPar)$fd
hgtffd <- smooth.basis(age, growth$hgtf, growfdPar)$fd
#  Compute the acceleration functions
accmfd <- deriv.fd(hgtmfd, 2)
accffd <- deriv.fd(hgtffd, 2)
#  Plot the two sets of curves
par(mfrow=c(2,1))
plot(accmfd)
plot(accffd)




