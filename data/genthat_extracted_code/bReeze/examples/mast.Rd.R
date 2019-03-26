library(bReeze)


### Name: mast
### Title: Creation of met mast objects
### Aliases: mast plot.mast
### Keywords: methods

### ** Examples

## Not run: 
##D ## load data, prepare sets and time stamp
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5],
##D   dir.avg=winddata[,14])
##D set30 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9],
##D   dir.avg=winddata[,16])
##D set20 <- set(height=20, v.avg=winddata[,10], v.std=winddata[,13])
##D ts <- timestamp(timestamp=winddata[,1])
##D 
##D ## create met mast object
##D neubuerg <- mast(timestamp=ts, set40, set30, set20)  # default
##D 
##D # add location and description
##D neubuerg.2 <- mast(timestamp=ts, set40, set30, set20, 
##D   loc=c(49.8909,11.4017), desc="Site #247 - Neubuerg")
##D 
##D # name sets
##D neubuerg.3 <- mast(timestamp=ts, C1.A1=set40, C2.A2=set30, 
##D   C3=set20, loc=c(49.8909,11.4017), desc="Site #247 - Neubuerg")
##D 
##D 
##D ## plot met mast (time series)
##D plot(neubuerg)  # default
##D plot(neubuerg, set=1, legend=FALSE)  # only one set
##D plot(neubuerg, set="set1", legend=FALSE)  # same as above 
##D plot(neubuerg, signal=c("v.avg", "dir.avg"))  # change signals
##D 
##D # change time scale
##D plot(neubuerg, subset=c("2010-01-01 00:10:00", NA))
##D plot(neubuerg, subset=c("2009-10-11 00:10:00", "2009-10-11 23:50:00"))
##D plot(neubuerg, set=1, signal="dir.avg", subset=c(NA, "2009-12-27 18:30:00"))
##D 
##D # customize plot
##D plot(neubuerg, bty="n", bty.leg="o", cex.axis=1.2, cex.lab=1.4, cex.leg=1.2, 
##D   col=c("darkblue", "red2", "darkgreen"), col.axis="darkgray", 
##D   col.lab="darkgray", col.leg="darkgray", col.ticks="darkgray", 
##D   las=0, lty=rep(1.5,3), mar=c(0.5,4,0,0.5), mgp=c(2,0.5,0), 
##D   ylab=c("v [m/s]","dir [deg]","ti [-]"), x.intersp=1)
## End(Not run)



