library(fda)


### Name: df2lambda
### Title: Convert Degrees of Freedom to a Smoothing Parameter Value
### Aliases: df2lambda
### Keywords: smooth

### ** Examples


#  Smooth growth curves using a specified value of
#  degrees of freedom.
#  Set up the ages of height measurements for Berkeley data
age <- c( seq(1, 2, 0.25), seq(3, 8, 1), seq(8.5, 18, 0.5))
#  Range of observations
rng <- c(1,18)
#  Set up a B-spline basis of order 6 with knots at ages
knots  <- age
norder <- 6
nbasis <- length(knots) + norder - 2
hgtbasis <- create.bspline.basis(rng, nbasis, norder, knots)
#  Find the smoothing parameter equivalent to 12
#  degrees of freedom
lambda <- df2lambda(age, hgtbasis, df=12)
#  Set up a functional parameter object for estimating
#  growth curves.  The 4th derivative is penalyzed to
#  ensure a smooth 2nd derivative or acceleration.
Lfdobj <- 4
growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)
#  Smooth the data.  The data for the girls are in matrix
#  hgtf.
hgtffd <- smooth.basis(age, growth$hgtf, growfdPar)$fd
#  Plot the curves
plot(hgtffd)




