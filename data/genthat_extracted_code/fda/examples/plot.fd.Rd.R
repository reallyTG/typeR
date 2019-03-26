library(fda)


### Name: plot.fd
### Title: Plot a Functional Data Object
### Aliases: plot.fd plot.fdPar plot.fdSmooth
### Keywords: smooth hplot

### ** Examples

##
## plot.fd
##

daybasis65 <- create.fourier.basis(c(0, 365), 65,
                    axes=list("axesIntervals"))

daytempfd <- with(CanadianWeather, Data2fd(day.5,
        dailyAv[,,"Temperature.C"], daybasis65))

#  plot all the temperature functions for the monthly weather data
plot(daytempfd, main="Temperature Functions")

## Not run: 
##D # To plot one at a time:
##D # The following pauses to request page changes.
##D plot(daytempfd, ask=TRUE)
## End(Not run)

# test plot(fd with NA)
daytempfd$coefs[,1] <- NA
plot(daytempfd, main="Temperature Functions")

##
## plot.fdSmooth
##
b3.4 <- create.bspline.basis(norder=3, breaks=c(0, .5, 1))
# 4 bases, order 3 = degree 2 =
# continuous, bounded, locally quadratic
fdPar3 <- fdPar(b3.4, lambda=1)

# Penalize excessive slope Lfdobj=1;
# (Can not smooth on second derivative Lfdobj=2 at it is discontinuous.)
fd3.4s0 <- smooth.basis(0:1, 0:1, fdPar3)

# using plot.fd directly
plot(fd3.4s0$fd)

# same plot via plot.fdSmooth
plot(fd3.4s0)
##
## with Date and POSIXct argvals
##
# Date
invasion1 <- as.Date('1775-09-04')
invasion2 <- as.Date('1812-07-12')
earlyUS.Canada <- c(invasion1, invasion2)
BspInvasion <- create.bspline.basis(earlyUS.Canada)

earlyUSyears <- seq(invasion1, invasion2, length.out=7)
(earlyUScubic <- (as.numeric(earlyUSyears-invasion1)/365.24)^3)
fitCubic <- smooth.basis(earlyUSyears, earlyUScubic, BspInvasion)
plot(fitCubic)

# POSIXct
AmRev.ct <- as.POSIXct1970(c('1776-07-04', '1789-04-30'))
BspRev.ct <- create.bspline.basis(AmRev.ct)
AmRevYrs.ct <- seq(AmRev.ct[1], AmRev.ct[2], length.out=14)
(AmRevLin.ct <- as.numeric(AmRevYrs.ct-AmRev.ct[2]))
fitLin.ct <- smooth.basis(AmRevYrs.ct, AmRevLin.ct, BspRev.ct)
plot(fitLin.ct)




