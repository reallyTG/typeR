library(TRADER)


### Name: boundaryGet
### Title: Get values for fitting boundary line.
### Aliases: boundaryGet
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)
bo<-boundaryGet(relData1)
plot(bo)
plotBoundary(bo$bo,bo$x,bo$y,boundary=function(x) {5.0067*exp(-0.664*x)})



