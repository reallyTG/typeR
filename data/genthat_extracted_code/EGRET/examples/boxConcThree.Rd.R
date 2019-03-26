library(EGRET)


### Name: boxConcThree
### Title: Three box plots side-by-side
### Aliases: boxConcThree
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water year:
boxConcThree(eList)
# Graphs consisting of Jun-Aug
eList <- setPA(eList, paStart=6,paLong=3)
boxConcThree(eList)



