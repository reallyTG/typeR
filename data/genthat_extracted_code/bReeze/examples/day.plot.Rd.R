library(bReeze)


### Name: day.plot
### Title: Plot diurnal wind speed
### Aliases: day.plot day
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
##D # plot all datasets
##D day.plot(mast=neubuerg, signal="v.avg")
##D day.plot(mast=neubuerg, signal="dir.avg")
##D 
##D # plot one dataset
##D day.plot(mast=neubuerg, set=1, signal="v.avg")
##D day.plot(mast=neubuerg, set="set1", signal="v.avg")	# same as above
##D day.plot(mast=neubuerg, set=2, signal="dir.avg")
##D 
##D # sectoral plot
##D day.plot(mast=neubuerg, set=1, signal="v.avg", num.sectors=8)
##D 
##D # data subsets
##D day.plot(mast=neubuerg, signal="v.avg", 
##D   subset=c("2009-12-01 00:00:00", "2009-12-31 23:50:00"))
##D day.plot(mast=neubuerg, signal="v.avg",  
##D   subset=c("2010-01-01 00:00:00", NA)) # just 'start' time stamp
##D day.plot(mast=neubuerg, set=1, signal="v.avg", num.sectors=4, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D # customize plot
##D day.plot(mast=neubuerg, signal="v.avg", 
##D   bty="l", cex.axis=0.8, cex.lab=0.9, cex.leg=0.7, 
##D   col=c("darkgreen", "royalblue", "purple"), col.axis="darkgray", 
##D   col.box="darkgray", col.lab="darkgray", col.leg="darkgray", 
##D   col.ticks="darkgray", las=2, lty=c(2,3,4), lwd=1.5, mar=c(3, 3, 0.5, 0.5), 
##D   mgp=c(1.5, 0.5, 0), pos.leg="topleft", xlab="hour", ylab="velocity", 
##D   ylim=c(3.5,6), x.intersp=1, y.intersp=1)
## End(Not run)



