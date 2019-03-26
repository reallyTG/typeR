library(EGRET)


### Name: plotFluxQ
### Title: Sample data plot: observed log flux vs log discharge
### Aliases: plotFluxQ
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotFluxQ(eList, qUnit = 1, fluxUnit = 1)
plotFluxQ(eList, fluxUnit = 'kgDay')
plotFluxQ(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotFluxQ(eList)



