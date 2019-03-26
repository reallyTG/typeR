library(fda)


### Name: fRegress
### Title: Functional Regression Analysis
### Aliases: fRegress fRegress.fd fRegress.fdPar fRegress.numeric
###   fRegress.formula fRegress.character
### Keywords: smooth

### ** Examples

###
###
### scalar response and explanatory variable
###   ... to compare fRegress and lm
###
###
# example from help('lm')
     ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
     trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
     group <- gl(2,10,20, labels=c("Ctl","Trt"))
     weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)

fRegress.D9 <- fRegress(weight ~ group)

(lm.D9.coef <- coef(lm.D9))

(fRegress.D9.coef <- sapply(fRegress.D9$betaestlist, coef))

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(as.numeric(lm.D9.coef), as.numeric(fRegress.D9.coef))
## Don't show: 
)
## End(Don't show)

###
###
### vector response with functional explanatory variable
###
###

##
## set up
##
annualprec <- log10(apply(CanadianWeather$dailyAv[,,"Precipitation.mm"],
                          2,sum))
# The simplest 'fRegress' call is singular with more bases
# than observations, so we use a small basis for this example
smallbasis  <- create.fourier.basis(c(0, 365), 25)
# There are other ways to handle this,
# but we will not discuss them here
tempfd <- smooth.basis(day.5,
          CanadianWeather$dailyAv[,,"Temperature.C"], smallbasis)$fd

##
## formula interface
##

precip.Temp.f <- fRegress(annualprec ~ tempfd)

##
## Get the default setup and modify it
##

precip.Temp.mdl <- fRegress(annualprec ~ tempfd, method='m')
# First confirm we get the same answer as above:
precip.Temp.m <- do.call('fRegress', precip.Temp.mdl)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(precip.Temp.m, precip.Temp.f)
## Don't show: 
)
## End(Don't show)

#  set up a smaller basis than for temperature
nbetabasis  <- 21
betabasis2.  <- create.fourier.basis(c(0, 365), nbetabasis)
betafd2.     <- fd(rep(0, nbetabasis), betabasis2.)
# add smoothing
betafdPar2.  <- fdPar(betafd2., lambda=10)

precip.Temp.mdl2 <- precip.Temp.mdl
precip.Temp.mdl2[['betalist']][['tempfd']] <- betafdPar2.

# Now do it.
precip.Temp.m2 <- do.call('fRegress', precip.Temp.mdl2)

# Compare the two fits
precip.Temp.f[['df']] # 26
precip.Temp.m2[['df']]# 22 = saved 4 degrees of freedom

(var.e.f <- mean(with(precip.Temp.f, (yhatfdobj-yfdPar)^2)))
(var.e.m2 <- mean(with(precip.Temp.m2, (yhatfdobj-yfdPar)^2)))
# with a modest increase in lack of fit.

##
## Manual construction of xfdlist and betalist
##

xfdlist <- list(const=rep(1, 35), tempfd=tempfd)

# The intercept must be constant for a scalar response
betabasis1 <- create.constant.basis(c(0, 365))
betafd1    <- fd(0, betabasis1)
betafdPar1 <- fdPar(betafd1)

betafd2     <- with(tempfd, fd(basisobj=basis, fdnames=fdnames))
# convert to an fdPar object
betafdPar2  <- fdPar(betafd2)

betalist <- list(const=betafdPar1, tempfd=betafdPar2)

precip.Temp <- fRegress(annualprec, xfdlist, betalist)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(precip.Temp, precip.Temp.f)
## Don't show: 
)
## End(Don't show)

###
###
### functional response with vector explanatory variables
###
###

##
## simplest:  formula interface
##
daybasis65 <- create.fourier.basis(rangeval=c(0, 365), nbasis=65,
                  axes=list('axesIntervals'))
Temp.fd <- with(CanadianWeather, smooth.basisPar(day.5,
                dailyAv[,,'Temperature.C'], daybasis65)$fd)
TempRgn.f <- fRegress(Temp.fd ~ region, CanadianWeather)

##
## Get the default setup and possibly modify it
##
TempRgn.mdl <- fRegress(Temp.fd ~ region, CanadianWeather, method='m')
# make desired modifications here
# then run
TempRgn.m <- do.call('fRegress', TempRgn.mdl)

# no change, so match the first run
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(TempRgn.m, TempRgn.f)
## Don't show: 
)
## End(Don't show)

##
## More detailed set up
##
region.contrasts <- model.matrix(~factor(CanadianWeather$region))
rgnContr3 <- region.contrasts
dim(rgnContr3) <- c(1, 35, 4)
dimnames(rgnContr3) <- list('', CanadianWeather$place, c('const',
   paste('region', c('Atlantic', 'Continental', 'Pacific'), sep='.')) )

const365 <- create.constant.basis(c(0, 365))
region.fd.Atlantic <- fd(matrix(rgnContr3[,,2], 1), const365)
region.fd.Continental <- fd(matrix(rgnContr3[,,3], 1), const365)
region.fd.Pacific <- fd(matrix(rgnContr3[,,4], 1), const365)
region.fdlist <- list(const=rep(1, 35),
     region.Atlantic=region.fd.Atlantic,
     region.Continental=region.fd.Continental,
     region.Pacific=region.fd.Pacific)

beta1 <- with(Temp.fd, fd(basisobj=basis, fdnames=fdnames))
beta0 <- fdPar(beta1)
betalist <- list(const=beta0, region.Atlantic=beta0,
             region.Continental=beta0, region.Pacific=beta0)

TempRgn <- fRegress(Temp.fd, region.fdlist, betalist)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(TempRgn, TempRgn.f)
## Don't show: 
)
## End(Don't show)

###
###
### functional response with
###            (concurrent) functional explanatory variable
###
###

##
##  predict knee angle from hip angle;  from demo('gait', package='fda')
##
## formula interface
##
(gaittime <- as.numeric(dimnames(gait)[[1]])*20)
gaitrange <- c(0,20)
gaitbasis <- create.fourier.basis(gaitrange, nbasis=21)
harmaccelLfd <- vec2Lfd(c(0, (2*pi/20)^2, 0), rangeval=gaitrange)
gaitfd <- smooth.basisPar(gaittime, gait,
       gaitbasis, Lfdobj=harmaccelLfd, lambda=1e-2)$fd
hipfd  <- gaitfd[,1]
kneefd <- gaitfd[,2]

knee.hip.f <- fRegress(kneefd ~ hipfd)

##
## manual set-up
##
#  set up the list of covariate objects
const  <- rep(1, dim(kneefd$coef)[2])
xfdlist  <- list(const=const, hipfd=hipfd)

beta0 <- with(kneefd, fd(basisobj=basis, fdnames=fdnames))
beta1 <- with(hipfd, fd(basisobj=basis, fdnames=fdnames))

betalist  <- list(const=fdPar(beta0), hipfd=fdPar(beta1))

fRegressout <- fRegress(kneefd, xfdlist, betalist)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(fRegressout, knee.hip.f)
## Don't show: 
)
## End(Don't show)

#See also the following demos:

#demo('canadian-weather', package='fda')
#demo('gait', package='fda')
#demo('refinery', package='fda')
#demo('weatherANOVA', package='fda')
#demo('weatherlm', package='fda')



