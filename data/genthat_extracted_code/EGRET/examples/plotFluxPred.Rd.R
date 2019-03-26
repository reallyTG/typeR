library(EGRET)


### Name: plotFluxPred
### Title: Graph of observed versus estimated flux
### Aliases: plotFluxPred
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotFluxPred(eList)
plotFluxPred(eList, fluxUnit = 'poundsDay')
plotFluxPred(eList, logScale=TRUE)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotFluxPred(eList)



