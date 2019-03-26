library(SpatialTools)


### Name: plot.contourLines
### Title: Plot contour lines
### Aliases: plot.contourLines
### Keywords: plot

### ** Examples

data(volcano)
x <- 10*1:nrow(volcano)
y <- 10*1:ncol(volcano)
cL <- contourLines(x, y, volcano)
plot.contourLines(cL)



