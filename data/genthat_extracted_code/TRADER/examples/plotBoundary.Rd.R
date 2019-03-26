library(TRADER)


### Name: plotBoundary
### Title: Plot boundary line.
### Aliases: plotBoundary
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)
bo<-boundaryGet(relData1)
bofit<-boundaryFit(bo$bo,bo$x,bo$y)

plotBoundary(bo$bo,bo$x,bo$y,boundary=bofit$fun,rsq=bofit$rsq)



