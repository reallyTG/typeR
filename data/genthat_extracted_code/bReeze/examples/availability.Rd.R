library(bReeze)


### Name: availability
### Title: Calculate availability for pairs of wind speed and direction
### Aliases: availability avail plot.availability
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
##D neubuerg <- mast(timestamp=ts, set40=set40, set30=set30, 
##D   set20=set20)
##D neubuerg <- clean(mast=neubuerg)
##D 
##D 
##D ## calculate availability
##D neubuerg.avail <- availability(mast=neubuerg)
##D 
##D # compare the total availability of 'set40' and 'set30'
##D neubuerg.avail$set40$total
##D neubuerg.avail$set30$total
##D 
##D # check the daily availability of 'set40'
##D neubuerg.avail$set40$daily
##D 
##D # note: availability for 'set20' is missing - its availability is NULL,
##D # since it does not contain wind direction data
##D 
##D # calculate availability for 'set20' using wind direction data from 'set40'
##D set20.avail <- availability(mast=neubuerg, v.set=3, dir.set=1)
##D # same as above
##D set20.avail <- availability(mast=neubuerg, v.set="set20", dir.set="set40")
##D 
##D # calculate availability for all sets using wind direction data from 'set40'
##D neubuerg.avail <- availability(mast=neubuerg, v.set=c(1,2,3), dir.set=1)
##D 
##D # data subsets
##D availability(mast=neubuerg, v.set=1, 
##D   subset=c("2009-12-01 00:10:00", "2009-12-31 23:50:00"))
##D availability(mast=neubuerg, v.set=1, 
##D   subset=c("2010-01-01 00:10:00", NA)) # just 'start' time stamp
##D availability(mast=neubuerg, v.set=1, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D # change number of digits and hide results
##D neubuerg.avail <- availability(mast=neubuerg, digits=0)
##D neubuerg.avail <- availability(mast=neubuerg, print=FALSE)
##D neubuerg.avail
##D 
##D 
##D ## plot availability objects
##D plot(neubuerg.avail)  # default
##D plot(neubuerg.avail, set=2)	 # one dataset
##D plot(neubuerg.avail, set="set30")  # same as above
##D plot(neubuerg.avail, set=c(1,2))  # several datasets
##D 
##D # customize plot
##D plot(neubuerg.avail, border="darkgray", cex.axis=0.7, 
##D   cex.lab=0.9, col=c("darkgreen", "orange", "red4"), col.axis="blue", 
##D   col.lab="blue", fill=c("lightgreen", "yellow", "red"), lwd=0.5, 
##D   mar=c(1,1,1,1), plot.names=FALSE, xlab="jour", ylab="mois")
## End(Not run)



