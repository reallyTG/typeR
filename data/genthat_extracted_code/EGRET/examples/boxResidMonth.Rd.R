library(EGRET)


### Name: boxResidMonth
### Title: A box plot of WRTDS residuals by month
### Aliases: boxResidMonth
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
boxResidMonth(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
boxResidMonth(eList)



