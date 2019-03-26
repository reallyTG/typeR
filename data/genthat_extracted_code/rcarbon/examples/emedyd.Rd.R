library(rcarbon)


### Name: emedyd
### Title: Radiocarbon dates for the Eastern Mediterranean around the
###   Younger Dryas
### Aliases: emedyd
### Keywords: datasets

### ** Examples

## Not run: 
##D data(emedyd)
##D northernlevant <- emedyd[emedyd$Region=="2",]
##D bins <- binPrep(northernlevant$SiteName, northernlevant$CRA, h=50)
##D x <- calibrate(northernlevant$CRA, northernlevant$Error, normalised=FALSE)
##D spd.northernlevant <- spd(x, bins=bins, runm=50, timeRange=c(17000,8000))
##D plot(spd.northernlevant)
## End(Not run)



