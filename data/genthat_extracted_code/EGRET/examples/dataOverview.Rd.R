library(EGRET)


### Name: dataOverview
### Title: Data Overview for WRTDS
### Aliases: dataOverview
### Keywords: USGS WRTDS data import

### ** Examples

eList <- Choptank_eList
exDaily <- getDaily(eList)
exSample <- getSample(eList)
dataOverview(Daily = exDaily, Sample = exSample)



