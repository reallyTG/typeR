library(bReeze)


### Name: weibull
### Title: Calculation of Weibull parameters
### Aliases: weibull wb plot.weibull
### Keywords: methods

### ** Examples

## Not run: 
##D ## load and prepare data
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], dir.avg=winddata[,14])
##D set30 <- set(height=30, v.avg=winddata[,6], dir.avg=winddata[,16])
##D set20 <- set(height=20, v.avg=winddata[,10])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set40, set30, set20)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D 
##D ## calculate Weibull parameters
##D weibull(mast=neubuerg, v.set=1)  # default
##D 
##D # if only one of v.set and dir.set is given, 
##D # the dataset is assigned to both
##D weibull(mast=neubuerg, v.set=1)
##D weibull(mast=neubuerg, dir.set=1)
##D weibull(mast=neubuerg, dir.set="set1")
##D 
##D # change number of direction sectors
##D weibull(mast=neubuerg, v.set=1, num.sectors=16)
##D 
##D # data subsets
##D weibull(mast=neubuerg, v.set=1, 
##D   subset=c("2009-12-01 00:00:00", "2009-12-31 23:50:00"))
##D weibull(mast=neubuerg, v.set=1, 
##D   subset=c("2010-01-01 00:00:00", NA)) # just 'start' time stamp
##D weibull(mast=neubuerg, v.set=1, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D # change number of digits and hide results
##D neubuerg.wb <- weibull(mast=neubuerg, v.set=1, digits=2, print=FALSE)
##D 
##D 
##D ## plot weibull objects - histogram plot
##D plot(neubuerg.wb)  # default
##D plot(neubuerg.wb, type="dir")  # same as above
##D plot(neubuerg.wb, show.ak=TRUE)  # show parameters in legend
##D 
##D # customize plot
##D plot(neubuerg.wb, bty="l", bty.leg="l", cex.axis=1.2, cex.lab=1.4, cex.leg=0.9, 
##D   col.axis="darkgray", col.box="darkgray", col.lab="darkgray", col.leg="darkgray", 
##D   col.ticks="darkgray", las=0, leg.text=c("measured", "calculated"), 
##D   mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), pos.leg="right", xlab="velocity [m/s]", 
##D   ylab="frequency [%]", xlim=c(0,20), ylim=c(0,15), x.intersp=1, y.intersp=1)
##D 
##D # customize bars
##D plot(neubuerg.wb, border="darkgray", breaks=seq(0,21,0.5), 
##D   col="lightgray")
##D 
##D # customize line
##D plot(neubuerg.wb, line="black", lty="dotdash", lwd=2)
##D 
##D 
##D ## plot weibull objects - directional plot
##D plot(neubuerg.wb, type="dir")
##D 
##D # show parameters in legend
##D plot(neubuerg.wb, type="dir", show.ak=TRUE)
##D 
##D # customize plot
##D plot(neubuerg.wb, type="dir", bty="l", bty.leg="o", cex.axis=0.8, cex.lab=0.9, 
##D   cex.leg=0.7, col=c(rainbow(12), gray(0.4)), col.axis=gray(0.2), col.box=gray(0.4), 
##D   col.lab=gray(0.2), col.leg=gray(0.2), col.ticks=gray(0.2), las=0, 
##D   lty=c(rep(3, 12), 1), lwd=c(rep(1, 12), 2), mar=c(3,3,0.5,0.5), mgp=c(1.5,0.5,0), 
##D   pos.leg="right", xlab="velocity [m/s]", ylab="frequency [m/s]", xlim=c(0,15), 
##D   ylim=c(0,25), x.intersp=1, y.intersp=1)
## End(Not run)



