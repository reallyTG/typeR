library(bReeze)


### Name: turbulence
### Title: Calculation of turbulence intensity
### Aliases: turbulence turb
### Keywords: methods

### ** Examples

## Not run: 
##D ## load and prepare data
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5],
##D   dir.avg=winddata[,14])
##D set30 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9],
##D   dir.avg=winddata[,16])
##D set20 <- set(height=20, v.avg=winddata[,10], v.std=winddata[,13])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set40, set30, set20)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D 
##D ## calculate turbulence intensity
##D turbulence(mast=neubuerg, turb.set=1)  # default
##D turbulence(mast=neubuerg, turb.set=1, dir.set=2)  # use different datasets
##D turbulence(mast=neubuerg, turb.set="set1", dir.set="set2")  # same as above
##D turbulence(mast=neubuerg, turb.set=1, num.sectors=4)  # change sector number
##D 
##D # calculate turbulence intensity for 1 m/s speed bins and without binning
##D turbulence(mast=neubuerg, turb.set=1, bins=1:25)
##D turbulence(mast=neubuerg, turb.set=1, bins=NULL)
##D 
##D # data subset
##D turbulence(mast=neubuerg, turb.set=1, 
##D   subset=c(NA, "2010-01-01 00:00:00"))
##D 
##D # change number of digits and hide results
##D turbulence(mast=neubuerg, turb.set=1, digits=2)
##D neubuerg.ti <- turbulence(mast=neubuerg, turb.set=1, print=FALSE)
##D neubuerg.ti
##D 
##D 
##D ## plot turbulence intensity object
##D plot(neubuerg.ti)  # default
##D 
##D # change colour, text size etc.
##D plot(neubuerg.ti, cex.axis=0.7, cex.lab=0.9, circles=c(0.05,0.20,0.05), 
##D   col="lightgray", col.axis="darkgray", col.border="gray", col.circle="darkgray", 
##D   col.cross="darkgray", col.lab="darkgray", fg=TRUE, lty.circle="dotdash", 
##D   lty.cross="longdash", lwd.border=1.2, lwd.circle=1.2, lwd.cross=1.2, 
##D   pos.axis=135, sec.space=0.6)
## End(Not run)



