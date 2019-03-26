library(xROI)


### Name: rasterizeROI
### Title: Rasterize ROI Polygons
### Aliases: rasterizeROI
### Keywords: Polygons ROI Rasterize

### ** Examples


pnts <- matrix(c(0.1, 0.2,
                 0.1, 0.4,
                 0.5, 0.4,
                 0.5, 0.2),
                 4, 2, byrow= TRUE)
imgSize <- c(300, 400)
m <- rasterizeROI(pnts, imgSize)
xROI::addMask(m, add = FALSE)




