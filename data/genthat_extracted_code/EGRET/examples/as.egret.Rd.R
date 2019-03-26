library(EGRET)


### Name: as.egret
### Title: Create named list for EGRET analysis
### Aliases: as.egret
### Keywords: USGS WRTDS data import

### ** Examples

eList <- Choptank_eList
Daily <- getDaily(eList)
INFO <- getInfo(eList)
eList_flowHistory <- as.egret(INFO, Daily)
plotFlowSingle(eList_flowHistory, 1)
Sample <- getSample(eList)
surfaces <- getSurfaces(eList)
eList_full <- as.egret(INFO, Daily, Sample, surfaces)
plotFluxQ(eList_full)



