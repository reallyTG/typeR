library(bReeze)


### Name: windprofile
### Title: Calculate wind profile
### Aliases: windprofile pro plot.windprofile
### Keywords: methods

### ** Examples

## Not run: 
##D ## load and prepare data
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], dir.avg=winddata[,14])
##D set30 <- set(height=30, v.avg=winddata[,6], dir.avg=winddata[,16])
##D set20 <- set(height=20, v.avg=winddata[,10], v.std=winddata[,13])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set40, set30, set20)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D 
##D ## calculate profile
##D # create profile based on one height
##D windprofile(mast=neubuerg, v.set=1, dir.set=1)	# default alpha=0.2
##D windprofile(mast=neubuerg, v.set=1, dir.set=1, alpha=0.15)
##D 
##D # calculate profile based on two heights
##D windprofile(mast=neubuerg, v.set=c(1,2), dir.set=1)
##D windprofile(mast=neubuerg, v.set=c(1,3), dir.set=1)
##D # same as above
##D windprofile(mast=neubuerg, v.set=c("set1", "set3"), dir.set="set1")
##D 
##D # calculate profile based on three heights
##D windprofile(mast=neubuerg, v.set=c(1,2,3), dir.set=1)
##D 
##D # change the method used for computation
##D # note: negative alphas!
##D windprofile(mast=neubuerg, v.set=c(1,2), dir.set=1, method="loglm")
##D 
##D # change number of direction sectors
##D windprofile(mast=neubuerg, v.set=c(1,2), dir.set=1, num.sectors=8)
##D 
##D # data subsets
##D windprofile(mast=neubuerg, v.set=1, dir.set=1, 
##D   subset=c("2009-12-01 00:00:00", "2009-12-31 23:50:00"))
##D windprofile(mast=neubuerg, v.set=c(1,2), dir.set=1, 
##D   subset=c("2010-01-01 00:00:00", NA)) # just 'start' time stamp
##D windprofile(mast=neubuerg, v.set=c(1:3), dir.set=1, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D # change number of digits and hide results
##D windprofile(mast=neubuerg, v.set=1, dir.set=1, digits=2)
##D neubuerg.wp <- windprofile(mast=neubuerg, v.set=1, dir.set=1, print=FALSE)
##D neubuerg.wp
##D 
##D 
##D ## plot profile objects
##D plot(neubuerg.wp)  # default
##D plot(neubuerg.wp, measured=FALSE)  # omit 'measured' points
##D 
##D # plot only one sector
##D plot(neubuerg.wp, sector=3)	# ENE by sector number
##D plot(neubuerg.wp, sector="ene")	# ENE by sector code
##D plot(neubuerg.wp, sector="all")	# general profile
##D 
##D # customize plot
##D plot(neubuerg.wp, bty="l", bty.leg="o", cex.axis=0.8, 
##D   cex.lab=0.9, cex.leg=0.7, col=rainbow(13), col.axis=gray(0.2), 
##D   col.box=gray(0.2), col.lab=gray(0.2), col.leg=gray(0.2), 
##D   col.ticks=gray(0.2), las=0, lty=c(rep(3,12),1), 
##D   lwd=c(rep(1.2,12), 1.7), mar=c(3,3,0.5,0.5), mgp=c(2,0.7,0), 
##D   pos.leg="right", xlab="velocity [m/s]", ylab="height [m]", 
##D   xlim=c(0,11), ylim=c(0,150), x.intersp=1, y.intersp=1.2)
## End(Not run)



