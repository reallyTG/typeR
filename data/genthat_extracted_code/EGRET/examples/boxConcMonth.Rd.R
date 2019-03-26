library(EGRET)


### Name: boxConcMonth
### Title: Box plot of the water quality data by month
### Aliases: boxConcMonth
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
boxConcMonth(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
boxConcMonth(eList)



