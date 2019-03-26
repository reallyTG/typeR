library(bReeze)


### Name: bReeze-package
### Title: Functions for Wind Resource Assessment
### Aliases: bReeze-package bReeze
### Keywords: package

### ** Examples

## Not run: 
##D # load example data
##D data("winddata", package="bReeze")
##D 
##D # create two datasets
##D set40 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5],
##D   dir.avg=winddata[,14])
##D set30 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9],
##D   dir.avg=winddata[,16])
##D 
##D # format time stamp
##D ts <- timestamp(timestamp=winddata[,1])
##D 
##D # create met mast object
##D metmast <- mast(timestamp=ts, set40=set40, set30=set30)
##D 
##D # plot time series of met mast signals
##D plot(metmast)
##D 
##D # calculate frequency and mean wind speed per wind direction sector
##D freq <- frequency(mast=metmast, v.set=1)
##D 
##D # plot frequency
##D plot(freq)
##D 
##D # calculate availability of pairs of wind speed and direction
##D availability(mast=metmast)
##D 
##D # calculate monthly means of wind speed
##D month.stats(mast=metmast)
##D 
##D # calculate turbulence intensity
##D turbulence(mast=metmast, turb.set=1)
##D 
##D # calculate weibull parameters
##D wb <- weibull(mast=metmast, v.set=1)
##D 
##D # calculate total wind energy content
##D energy(wb=wb)
##D 
##D # calculate wind profile
##D pf <- windprofile(mast=metmast, v.set=c(1,2), dir.set=1)
##D 
##D # import power curve
##D pc <- pc("Enercon_E126_7.5MW.pow")
##D 
##D # calculate annual energy production
##D aep <- aep(profile=pf, pc=pc, hub.h=135)
##D 
##D # plot AEP
##D plot(aep)
## End(Not run)



