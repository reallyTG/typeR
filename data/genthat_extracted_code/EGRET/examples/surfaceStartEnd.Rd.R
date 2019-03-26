library(EGRET)


### Name: surfaceStartEnd
### Title: Surface date limits
### Aliases: surfaceStartEnd

### ** Examples

eList <- Choptank_eList
Date1 <- eList$Sample$Date[1]
Date2 <- range(eList$Sample$Date)[2]
surfaceStartEnd(10, 12, Date1, Date2)



