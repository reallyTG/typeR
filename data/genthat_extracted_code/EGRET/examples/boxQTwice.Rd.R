library(EGRET)


### Name: boxQTwice
### Title: Two box plots side-by-side, discharge on sample days, and
###   discharge on all days
### Aliases: boxQTwice
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
boxQTwice(eList)
boxQTwice(eList, qUnit=1)
boxQTwice(eList, qUnit='cfs')
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
boxQTwice(eList)



