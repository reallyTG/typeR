library(fda)


### Name: mean.fd
### Title: Mean of Functional Data
### Aliases: mean.fd
### Keywords: smooth

### ** Examples

##
## 1.  univeriate:  lip motion
##
liptime  <- seq(0,1,.02)
liprange <- c(0,1)

#  -------------  create the fd object -----------------
#       use 31 order 6 splines so we can look at acceleration

nbasis <- 51
norder <- 6
lipbasis <- create.bspline.basis(liprange, nbasis, norder)

#  ------------  apply some light smoothing to this object  -------

lipLfdobj   <- int2Lfd(4)
lipLambda   <- 1e-12
lipfdPar <- fdPar(lipbasis, lipLfdobj, lipLambda)

lipfd <- smooth.basis(liptime, lip, lipfdPar)$fd
names(lipfd$fdnames) = c("Normalized time", "Replications", "mm")

lipmeanfd <- mean.fd(lipfd)
plot(lipmeanfd)

##
## 2.  Trivariate:  CanadianWeather
##
dayrng <- c(0, 365)

nbasis <- 51
norder <- 6

weatherBasis <- create.fourier.basis(dayrng, nbasis)

weather.fd <- smooth.basis(day.5, CanadianWeather$dailyAv,
                           weatherBasis)$fd

str(weather.fd.mean <- mean.fd(weather.fd))




