library(bReeze)


### Name: frequency
### Title: Calculation of frequency and mean wind speed
### Aliases: frequency freq
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
##D ## calculate frequency
##D frequency(mast=neubuerg, v.set=1)
##D 
##D # if only one of v.set and dir.set is given, 
##D # the dataset is assigned to both
##D frequency(mast=neubuerg, v.set=1)
##D frequency(mast=neubuerg, dir.set=1)
##D 
##D # use different datasets for wind speed and direction
##D frequency(mast=neubuerg, v.set=3)	# no direction in dataset
##D frequency(mast=neubuerg, v.set=3, dir.set=2)
##D frequency(mast=neubuerg, v.set="set3", dir.set="set2")	# same as above
##D 
##D # change number of direction sectors 
##D frequency(mast=neubuerg, v.set=1, num.sectors=4)
##D frequency(mast=neubuerg, v.set=1, num.sectors=16)
##D 
##D # calculate frequency for 1 m/s speed bins and without binning
##D frequency(mast=neubuerg, v.set=1, bins=1:25)
##D frequency(mast=neubuerg, v.set=1, bins=0:25)	# same as above
##D frequency(mast=neubuerg, v.set=1, bins=NULL)
##D 
##D # data subsets
##D frequency(mast=neubuerg, v.set=1, 
##D   subset=c("2009-12-01 00:00:00", "2009-12-31 23:50:00"))
##D frequency(mast=neubuerg, v.set=1, 
##D   subset=c("2010-01-01 00:00:00", NA)) # just 'start' time stamp
##D frequency(mast=neubuerg, v.set=1, 
##D   subset=c(NA, "2009-12-31 23:50:00")) # just 'end' time stamp
##D 
##D # change number of digits and hide results
##D frequency(mast=neubuerg, v.set=1, digits=2)
##D neubuerg.freq <- frequency(mast=neubuerg, v.set=1, print=FALSE)
##D neubuerg.freq
##D 
##D ## plot frequency objects
##D plot(neubuerg.freq)  # default
##D plot(neubuerg.freq, col=gray(5:0 / 5.5), cex=0.8)  # change colours/text sizes
##D plot(neubuerg.freq, circles=c(10, 30, 10))  # manual definition of circles
##D plot(neubuerg.freq, fg=TRUE)  # plot sectors in foreground
##D plot(neubuerg.freq, pos.axis=135) # change axis label position
##D plot(neubuerg.freq, width.leg=0)  # no legend
##D 
##D # freaky
##D plot(neubuerg.freq, border.leg=heat.colors(5), bty.leg="o", 
##D   cex.axis=0.5, cex.lab=2, cex.leg=0.5, circles=c(5, 30, 5), 
##D   col=rainbow(5), col.axis="green", col.border="orange", 
##D   col.circle="purple", col.cross="yellow", col.lab="pink", 
##D   col.leg="lightblue", fg=TRUE, lwd.border=2, lwd.circle=3, lwd.cross=3, 
##D   lty.circle="12345678", lty.cross="87654321", sec.space=0.6, 
##D   title.leg="* WiNd SpEeD *", x.intersp=2, y.intersp=5)
## End(Not run)



