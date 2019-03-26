library(EGRET)


### Name: blankTime
### Title: Deletes the computed values during periods of time when there
###   are no sample data
### Aliases: blankTime
### Keywords: statistics water-quality

### ** Examples

startBlank = "2004-10-01"
endBlank = "2006-09-30"
eList <- Choptank_eList
eList <- blankTime(eList, startBlank, endBlank)



