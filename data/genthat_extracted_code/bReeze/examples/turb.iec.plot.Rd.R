library(bReeze)


### Name: turb.iec.plot
### Title: Plot turbulence intensity site classification
### Aliases: turb.iec.plot iec
### Keywords: methods

### ** Examples

## Not run: 
##D # load and prepare data
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5])
##D set30 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9])
##D set20 <- set(height=20, v.avg=winddata[,10], v.std=winddata[,13])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set40, set30, set20)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D # plot
##D turb.iec.plot(mast=neubuerg, set=1)
##D turb.iec.plot(mast=neubuerg, set="set1")	# same as above
##D 
##D # data subsets
##D turb.iec.plot(mast=neubuerg, set=1, 
##D   subset=c("2009-12-01 00:00:00", "2009-12-31 23:50:00"))
##D turb.iec.plot(mast=neubuerg, set=1,  
##D   subset=c("2010-01-01 00:00:00", NA)) # just 'start' time stamp
##D turb.iec.plot(mast=neubuerg, set=1, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D # customize plot
##D turb.iec.plot(mast=neubuerg, set=1, bty="l", cex.axis=0.8, cex.lab=0.9, 
##D   cex.leg=0.7, col.axis="darkblue", col.box="lightblue", col.lab=
##D   "darkblue", col.leg="darkblue", col.ticks="darkblue", las=0, 
##D   leg.text=c("IEC class A", "IEC class B", "IEC class C", "measured"), 
##D   mar=c(3,3,0.5,0.5), mgp=c(1.8,0.5,0), pos.leg="top", xlab="v [m/s]", 
##D   ylab="ti [-]", xlim=c(0,25), ylim=c(0,0.5), x.intersp=1, y.intersp=1)
##D 
##D # customize bars
##D turb.iec.plot(mast=neubuerg, set=1, col="gray", border="black", space=0.6)
##D 
##D # customize lines
##D turb.iec.plot(mast=neubuerg, set=1, line=gray(1:3 / 10), lty=2:4, 
##D   lwd=0.5:2.5)
## End(Not run)



