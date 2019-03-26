library(TRADER)


### Name: boundaryFit
### Title: Fit multiple boundary lines.
### Aliases: boundaryFit
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)
bo<-boundaryGet(relData1)
bofit<-boundaryFit(bo$bo,bo$x,bo$y)

plotBoundary(bo$bo,bo$x,bo$y,boundary=bofit$fun,rsq=bofit$rsq)
plotBoundary(bo$bo,bo$x,bo$y,boundary=function(x) {5.0067*exp(-0.664*x)})



