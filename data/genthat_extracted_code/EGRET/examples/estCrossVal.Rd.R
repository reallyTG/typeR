library(EGRET)


### Name: estCrossVal
### Title: Jack-Knife cross validation of the WRTDS (Weighted Regressions
###   on Time, Discharge, and Season)
### Aliases: estCrossVal
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
Sample <- getSample(eList)
Daily <- getDaily(eList)
numDays <- length(Daily$DecYear)
DecLow <- Daily$DecYear[1]
DecHigh <- Daily$DecYear[numDays]
## Not run: 
##D SampleCrossV <- estCrossVal(numDays,DecLow,DecHigh,Sample)
## End(Not run)



