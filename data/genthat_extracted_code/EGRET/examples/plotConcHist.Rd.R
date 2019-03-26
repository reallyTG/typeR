library(EGRET)


### Name: plotConcHist
### Title: Graph of annual concentration and flow normalized concentration
###   versus year
### Aliases: plotConcHist
### Keywords: graphics statistics water-quality

### ** Examples

yearStart <- 2001
yearEnd <- 2010
eList <- Choptank_eList

# Water year:
plotConcHist(eList, yearStart, yearEnd)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotConcHist(eList)



