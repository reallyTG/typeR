library(EGRET)


### Name: multiPlotDataOverview
### Title: Produces a 4 panel plot that gives an overview of the data set
###   prior to any processing
### Aliases: multiPlotDataOverview
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
multiPlotDataOverview(eList, qUnit=1)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
multiPlotDataOverview(eList, qUnit=1) 



