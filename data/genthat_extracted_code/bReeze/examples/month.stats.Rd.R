library(bReeze)


### Name: month.stats
### Title: Calculation of monthly statistics
### Aliases: month.stats ms plot.month.stats
### Keywords: methods

### ** Examples

## Not run: 
##D ## load and prepare data
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], v.max=winddata[,3])
##D set30 <- set(height=30, v.avg=winddata[,6], v.max=winddata[,7])
##D set20 <- set(height=20, v.avg=winddata[,10])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set40, set30, set20)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D ## calculate monthly means
##D neubuerg.stats <- month.stats(mast=neubuerg)  # default
##D month.stats(mast=neubuerg, set=1)  # one dataset
##D month.stats(mast=neubuerg, set="set1")  # same as above
##D month.stats(mast=neubuerg, signal="v.max")  # change signal
##D 
##D # calculate monthly median, min, max and standard deviation
##D month.stats(mast=neubuerg, fun="median")
##D month.stats(mast=neubuerg, fun="min")
##D month.stats(mast=neubuerg, fun="max")
##D month.stats(mast=neubuerg, fun="sd")
##D 
##D # data subsets
##D month.stats(mast=neubuerg, 
##D   subset=c("2009-12-01 00:10:00", "2009-12-31 23:50:00"))
##D month.stats(mast=neubuerg, 
##D   subset=c("2010-01-01 00:10:00", NA)) # just 'start' time stamp
##D month.stats(mast=neubuerg, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D month.stats(mast=neubuerg, digits=2)  # change number of digits
##D neubuerg.ms <- month.stats(mast=neubuerg, print=FALSE)  # hide results
##D neubuerg.ms
##D 
##D 
##D ## plot month stats object
##D plot(neubuerg.ms)  # default
##D plot(neubuerg.ms, set=1)  # one dataset
##D plot(neubuerg.ms, set="set1")  # same as above
##D 
##D # customize plot
##D plot(neubuerg.ms, border="darkgray", bty="l", cex.axis=0.7, 
##D   cex.lab=0.9, col=c(gray(0.3), gray(0.7)), col.axis="darkgray", 
##D   col.box="darkgray", col.lab="darkgray", col.ticks="darkgray", las=0, 
##D   legend=FALSE, mgp=c(2, 0.7, 0), plot.names=FALSE, ylim=c(0,7), 
##D   ylab="Wind speed [m/s]")
## End(Not run)



