library(fda)


### Name: Fperm.fd
### Title: Permutation F-test for functional linear regression.
### Aliases: Fperm.fd
### Keywords: smooth

### ** Examples

##
## 1.  yfdPar = vector
##
annualprec <- log10(apply(
    CanadianWeather$dailyAv[,,"Precipitation.mm"], 2,sum))

#  set up a smaller basis using only 40 Fourier basis functions
#  to save some computation time

smallnbasis <- 40
smallbasis  <- create.fourier.basis(c(0, 365), smallnbasis)
tempfd      <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"],
                       smallbasis)$fd
constantfd <- fd(matrix(1,1,35), create.constant.basis(c(0, 365)))

xfdlist <- vector("list",2)
xfdlist[[1]] <- constantfd
xfdlist[[2]] <- tempfd[1:35]

betalist   <- vector("list",2)
#  set up the first regression function as a constant
betabasis1 <- create.constant.basis(c(0, 365))
betafd1    <- fd(0, betabasis1)
betafdPar1 <- fdPar(betafd1)
betalist[[1]] <- betafdPar1

nbetabasis  <- 35
betabasis2  <- create.fourier.basis(c(0, 365), nbetabasis)
betafd2     <- fd(matrix(0,nbetabasis,1), betabasis2)

lambda        <- 10^12.5
harmaccelLfd365 <- vec2Lfd(c(0,(2*pi/365)^2,0), c(0, 365))
betafdPar2    <- fdPar(betafd2, harmaccelLfd365, lambda)
betalist[[2]] <- betafdPar2

# Should use the default nperm = 200
# but use 10 to save test time for illustration
F.res2 = Fperm.fd(annualprec, xfdlist, betalist, nperm=10)

##
## 2.  yfdpar = Functional data object (class fd)
##
# The very simplest example is the equivalent of the permutation
# t-test on the growth data.

# First set up a basis system to hold the smooths

# cut this example to reduce test time on CRAN
if(!CRAN()){

Knots  <- growth$age
norder <- 6
nbasis <- length(Knots) + norder - 2
hgtbasis <- create.bspline.basis(range(Knots), nbasis, norder, Knots)

# Now smooth with a fourth-derivative penalty and a very small smoothing
# parameter

Lfdobj <- 4
lambda <- 1e-2
growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)

hgtfd <- smooth.basis(growth$age,
                      cbind(growth$hgtm,growth$hgtf),growfdPar)$fd

# Now set up factors for fRegress:

cbasis = create.constant.basis(range(Knots))

maleind = c(rep(1,ncol(growth$hgtm)),rep(0,ncol(growth$hgtf)))

constfd = fd( matrix(1,1,length(maleind)),cbasis)
maleindfd = fd( matrix(maleind,1,length(maleind)),cbasis)

xfdlist = list(constfd,maleindfd)

# The fdPar object for the coefficients and call Fperm.fd

betalist = list(fdPar(hgtbasis,2,1e-6),fdPar(hgtbasis,2,1e-6))

# Should use nperm = 200 or so,
# but use 10 to save test time
Fres = Fperm.fd(hgtfd,xfdlist,betalist,nperm=10)
}




