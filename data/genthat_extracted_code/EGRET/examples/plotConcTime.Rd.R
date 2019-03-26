library(EGRET)


### Name: plotConcTime
### Title: Plot of Observed Concentration versus Time
### Aliases: plotConcTime
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
plotConcTime(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
plotConcTime(eList, qUnit = 1, qLower = 100, qUpper = 10000)
plotConcTime(eList, logScale=TRUE)
plotConcTime(eList, qUnit = 1, qLower = 100, qUpper = 10000, randomCensored = TRUE)



