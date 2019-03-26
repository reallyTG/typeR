library(EGRET)


### Name: plotFluxHist
### Title: Graph of annual flux and flow normalized flux versus year
### Aliases: plotFluxHist
### Keywords: graphics statistics water-quality

### ** Examples

yearStart <- 2001
yearEnd <- 2010
eList <- Choptank_eList
# Water year:
## Not run: 
##D plotFluxHist(eList)
##D plotFluxHist(eList, yearStart, yearEnd, fluxUnit = 1)
##D plotFluxHist(eList, yearStart, yearEnd, fluxUnit = 'kgDay')
##D # Graphs consisting of Jun-Aug
##D eList <- setPA(eList, paStart=6,paLong=3)
##D plotFluxHist(eList) 
##D 
## End(Not run)



