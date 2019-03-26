library(EGRET)


### Name: plotConcTimeSmooth
### Title: Plot up to three curves representing the concentration versus
###   time relationship, each curve representing a different flow.
### Aliases: plotConcTimeSmooth
### Keywords: graphics statistics water-quality

### ** Examples

q1 <- 10
q2 <- 25
q3 <- 75
centerDate <- "07-01"
yearStart <- 2000
yearEnd <- 2010
eList <- Choptank_eList
plotConcTimeSmooth(eList, q1, q2, q3, centerDate, yearStart, yearEnd)
plotConcTimeSmooth(eList, q1, q2, q3, centerDate, yearStart, yearEnd,logScale=TRUE)



