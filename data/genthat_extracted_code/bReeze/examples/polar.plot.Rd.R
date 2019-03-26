library(bReeze)


### Name: polar.plot
### Title: Plot wind speed vs. direction
### Aliases: polar.plot pol
### Keywords: methods

### ** Examples

## Not run: 
##D # load and prepare data
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], dir.avg=winddata[,14])
##D set30 <- set(height=30, v.avg=winddata[,6], dir.avg=winddata[,16])
##D set20 <- set(height=20, v.avg=winddata[,10])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set40, set30, set20)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D # plot v vs. dir
##D polar.plot(mast=neubuerg)
##D polar.plot(mast=neubuerg, v.set=3, dir.set=2)
##D polar.plot(mast=neubuerg, v.set="set3", dir.set="set2")	# same as above
##D 
##D # data subsets
##D polar.plot(mast=neubuerg, 
##D   subset=c("2009-12-01 00:00:00", "2009-12-31 23:50:00"))
##D polar.plot(mast=neubuerg,  
##D   subset=c("2010-01-01 00:00:00", NA)) # just 'start' time stamp
##D polar.plot(mast=neubuerg, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D # customize plot
##D polar.plot(mast=neubuerg, cex.axis=1.2, cex.lab=1.5, cex.pts=0.8, 
##D   circles=c(10,20,5), col="red3", col.axis=gray(0.2), col.circle=gray(0.3), 
##D   col.cross=gray(0.3), col.lab=gray(0.2), fg=TRUE, lty.circle="dotted", 
##D   lty.cross="longdash", lwd.circle=1.2, lwd.cross=1.2, pch=1, pos.axis=135)
## End(Not run)



