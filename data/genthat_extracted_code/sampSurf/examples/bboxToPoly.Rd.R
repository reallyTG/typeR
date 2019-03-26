library(sampSurf)


### Name: bboxToPoly
### Title: Function to Convert a Valid "bbox" to a "SpatialPolygons" Object
### Aliases: bboxToPoly
### Keywords: ~kwd1 ~kwd2

### ** Examples

cp = circularPlot(10, center=c(x=20,y=20))
cp.perim = perimeter(cp)
plot(cp.perim, axes=TRUE, lty='dashed')              #the perimeter of the plot
plot(bboxToPoly(cp.perim), add=TRUE, border='blue')  #the bounding box



