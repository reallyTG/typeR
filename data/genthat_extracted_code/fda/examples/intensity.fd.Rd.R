library(fda)


### Name: intensity.fd
### Title: Intensity Function for Point Process
### Aliases: intensity.fd
### Keywords: smooth

### ** Examples


#  Generate 101 Poisson-distributed event times with
#  intensity or rate two events per unit time
N  <- 101
mu <- 2
#  generate 101 uniform deviates
uvec <- runif(rep(0,N))
#  convert to 101 exponential waiting times
wvec <- -log(1-uvec)/mu
#  accumulate to get event times
tvec <- cumsum(wvec)
tmax <- max(tvec)
#  set up an order 4 B-spline basis over [0,tmax] with
#  21 equally spaced knots
tbasis <- create.bspline.basis(c(0,tmax), 23)
#  set up a functional parameter object for W(t),
#  the log intensity function.  The first derivative
#  is penalized in order to smooth toward a constant
lambda <- 10
Wfd0 <- fd(matrix(0,23,1),tbasis)
WfdParobj <- fdPar(Wfd0, 1, lambda)
#  estimate the intensity function
Wfdobj <- intensity.fd(tvec, WfdParobj)$Wfdobj
#  get intensity function values at 0 and event times
events <- c(0,tvec)
intenvec <- exp(eval.fd(events,Wfdobj))
#  plot intensity function
plot(events, intenvec, type="b")
lines(c(0,tmax),c(mu,mu),lty=4)




