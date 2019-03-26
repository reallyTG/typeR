library(EGRET)


### Name: plotConcQSmooth
### Title: Plot up to three curves representing the concentration versus
###   discharge relationship. Each curve is a different point in time.
### Aliases: plotConcQSmooth
### Keywords: graphics statistics water-quality

### ** Examples

date1<-"2001-06-01"
date2<-"2005-06-01"
date3<-"2010-06-01"
qLow<-1
qHigh<-100
eList <- Choptank_eList
plotConcQSmooth(eList, date1,date2,date3,qLow,qHigh)
plotConcQSmooth(eList, date1,date2,date3,qLow,qHigh,logScale=TRUE)



