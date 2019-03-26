library(rcarbon)


### Name: plot.CalSPD
### Title: Plot a summed probability distribution
### Aliases: plot.CalSPD

### ** Examples

## Not run: 
##D data(emedyd)
##D levant <- emedyd[emedyd$Region=="1"|emedyd$Region=="2",]
##D bins <- binPrep(levant$SiteName, levant$CRA, h=50)
##D x <- calibrate(levant$CRA, levant$Error, normalised=FALSE)
##D spd.levant <- spd(x, bins=bins, timeRange=c(17000,8000))
##D spd.northernlevant <- spd(x[levant$Region=="2"], bins=bins[levant$Region=="2"],
##D timeRange=c(17000,8000))
##D plot(spd.levant, runm=50, xlim=c(16000,9000))
##D plot(spd.northernlevant, runm=50, add=TRUE, fill.p="black")
##D legend("topleft", legend=c("All Levant dates","Northern Levant only"), 
##D fill=c("grey75","black"), border=NA)
##D plot(spd.levant, runm=50, xlim=c(16000,9000), type="simple")
##D plot(spd.northernlevant, runm=50, col="red", type="simple", add=TRUE)
## End(Not run)



