library(fda)


### Name: plotfit
### Title: Plot a Functional Data Object With Data
### Aliases: plotfit.fd plotfit.fdSmooth
### Keywords: smooth hplot

### ** Examples

#  set up a Fourier basis for smoothing temperature data
daybasis65 <- create.fourier.basis(c(0, 365), 65,
                    axes=list("axesIntervals"))
#  smooth the average temperature data using function Data2fd
Daytempfd <- with(CanadianWeather, smooth.basis(day.5,
         dailyAv[,,"Temperature.C"], daybasis65)$fd )
daytempfd <- with(CanadianWeather, smooth.basis(day.5,
         dailyAv[,,"Temperature.C"],
         daybasis65, fdnames=list("Day", "Station", "Deg C"))$fd )
#  Plot the temperature data along with the fit to the data for the first
#  station, St. John's Newfoundland
# If you want only the fitted functions, use plot(daytempfd)
# To plot only a single fit vs. observations, use argument index
# to request which one you want.
with(CanadianWeather, plotfit.fd(dailyAv[, , "Temperature.C",
     drop=FALSE], argvals= day.5, daytempfd, index=1, titles=place) )
# Default ylab = daytempfd[['fdnames']]

with(CanadianWeather, plotfit.fd(dailyAv[, , "Temperature.C"],
     argvals= day.5, Daytempfd, index=1, titles=place) )

plot(daytempfd)

## Not run: 
##D # plot all the weather stations, one by one after a click on the plot
##D # in response to a request.
##D # This example is within the "dontrun" environment to prevent the
##D # the R package checking process from pausing: without 'dontrun', the package
##D # build process might encounter problems with the par(ask=TRUE) feature.
##D with(CanadianWeather, plotfit.fd(dailyAv[,, "Temperature.C"], day.5,
##D      daytempfd, ask=TRUE) )
## End(Not run)
#  Now plot results for two weather stations.
op <- par(mfrow=c(2,1), xpd=NA, bty="n")
# xpd=NA:  clip lines to the device region,
#       not the plot or figure region
# bty="n":  Do not draw boxes around the plots.
ylim <- range(CanadianWeather$dailyAv[,,"Temperature.C"])
# Force the two plots to have the same scale
with(CanadianWeather, plotfit.fd(dailyAv[,,"Temperature.C"], day.5,
          daytempfd, index=2, titles=place, ylim=ylim) )
with(CanadianWeather, plotfit.fd(dailyAv[,,"Temperature.C"], day.5,
          daytempfd, index=35, titles=place, ylim=ylim) )
## Not run: 
##D # Plot residuals with interactive display of stations one by one
##D par(op)
##D with(CanadianWeather, plotfit.fd(dailyAv[, , "Temperature.C"],
##D           day.5, daytempfd, residual=TRUE) )
## End(Not run)
#  The gait data are bivariate, and this code illustrates how plotfit.fd
#  deals with the plotting of two variables at the same time
#  First define normalized times and their range
gaittime  <- as.numeric(dimnames(gait)[[1]])*20
gaitrange <- c(0,20)
#  Define the harmonic acceleration differential operator
harmaccelLfd <- vec2Lfd(c(0, (2*pi/20)^2, 0), rangeval=gaitrange)
#  Set up basis for representing gait data.
gaitbasis <- create.fourier.basis(gaitrange, nbasis=21)
#  Smooth the data
gaitfd <- smooth.basisPar(gaittime, gait,
       gaitbasis, Lfdobj=harmaccelLfd, lambda=1e-2)$fd
#  Assign names to the data
names(gaitfd$fdnames) <- c("Normalized time", "Child", "Angle")
gaitfd$fdnames[[3]] <- c("Hip", "Knee")
## Not run: 
##D #  plot each pair of curves interactively, two plots per page, the top
##D #  for hip angle, and the bottom for knee angle
##D plotfit.fd(gait, gaittime, gaitfd)
##D #  Plot the residuals, sorting cases by residual sum of squares summed over
##D #  both hip and knee angles.
##D #  The first series of 39 plots are for hip angle, two plots per page,
##D #  and the second 39 are for knee angle.  The plots are sorted by the
##D #  size of the total residual sum of squares, but RMS residual values
##D #  for specific angles are not all going to be in order.
##D plotfit.fd(gait, gaittime, gaitfd, residual=TRUE, sort=TRUE)
## End(Not run)



