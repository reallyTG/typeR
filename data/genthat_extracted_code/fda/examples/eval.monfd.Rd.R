library(fda)


### Name: eval.monfd
### Title: Values of a Monotone Functional Data Object
### Aliases: eval.monfd predict.monfd fitted.monfd residuals.monfd
### Keywords: smooth

### ** Examples


#  Estimate the acceleration functions for growth curves
#  See the analyses of the growth data.
#  Set up the ages of height measurements for Berkeley data
age <- c( seq(1, 2, 0.25), seq(3, 8, 1), seq(8.5, 18, 0.5))
#  Range of observations
rng <- c(1,18)
#  First set up a basis for monotone smooth
#  We use b-spline basis functions of order 6
#  Knots are positioned at the ages of observation.
norder <- 6
nage   <- length(age)
nbasis <- nage + norder - 2
wbasis <- create.bspline.basis(rng, nbasis, norder, age)
#  starting values for coefficient
cvec0 <- matrix(0,nbasis,1)
Wfd0  <- fd(cvec0, wbasis)
#  set up functional parameter object
Lfdobj    <- 3          #  penalize curvature of acceleration
lambda    <- 10^(-0.5)  #  smoothing parameter
growfdPar <- fdPar(Wfd0, Lfdobj, lambda)
#  Smooth the data for the first girl
hgt1 <- growth$hgtf[,1]
#   set conv = 0.1 and iterlim=1 to reduce the compute time
#   required for this test on CRAN;
#   We would not do this normally.
result <- smooth.monotone(age, hgt1, growfdPar, conv=0.1,
                          iterlim=1)
#  Extract the functional data object and regression
#  coefficients
Wfd  <- result$Wfdobj
beta <- result$beta
#  Evaluate the fitted height curve over a fine mesh
agefine <- seq(1,18,len=60)
hgtfine <- beta[1] + beta[2]*eval.monfd(agefine, Wfd)
#  Plot the data and the curve
plot(age, hgt1, type="p")
lines(agefine, hgtfine)
#  Evaluate the acceleration curve
accfine <- beta[2]*eval.monfd(agefine, Wfd, 2)
#  Plot the acceleration curve
plot(agefine, accfine, type="l")
lines(c(1,18),c(0,0),lty=4)

##
## using predict.monfd
##
hgtfit <- with(result, beta[1]+beta[2]*eval.monfd(argvals, Wfdobj))
hgtfit. <- fitted(result)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(hgtfit, hgtfit.)
## Don't show: 
)
## End(Don't show)

accfine. <- predict(result, agefine, Lfdobj=2)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(accfine, accfine.)
## Don't show: 
)
## End(Don't show)

growthResid <- resid(result)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(growthResid, with(result, y-hgtfit.))
## Don't show: 
)
## End(Don't show)




