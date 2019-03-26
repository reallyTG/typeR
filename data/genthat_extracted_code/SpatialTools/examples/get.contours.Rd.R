library(SpatialTools)


### Name: get.contours
### Title: Extracts coordinates from contourLines function
### Aliases: get.contours
### Keywords: contour contour lines level curve

### ** Examples

data(volcano)
x <- 10*1:nrow(volcano)
y <- 10*1:ncol(volcano)
cL <- contourLines(x, y, volcano)
out <- get.contours(cL)



