library(mrfDepth)


### Name: plotContours
### Title: Draws depth contours of bivariate data
### Aliases: plotContours
### Keywords: Graphical

### ** Examples

data(cardata90)
Result <- depthContour(x=cardata90, alpha=c(0.02,0.125,0.3) , type="hdepth")
plotContours(x = cardata90, depthContour = Result)
Result <- depthContour(x=cardata90, alpha=c(0.1, 0.2, 0.3, 0.4) , type="projdepth")
plotContours(x = cardata90, depthContour = Result)
Result <- depthContour(x=cardata90, alpha=c(0.1, 0.2, 0.3, 0.4) , type="sprojdepth")
plotContours(x = cardata90, depthContour = Result)




