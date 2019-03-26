library(plainview)


### Name: plainView
### Title: View raster objects interactively without background map but in
###   any CRS
### Aliases: plainView plainView,RasterLayer-method
###   plainView,RasterStackBrick-method
###   plainView,SpatialPixelsDataFrame-method plainview,ANY-method
###   plainview

### ** Examples

if (interactive()) {

  # RasterLayer
  plainView(poppendorf[[4]])

  # RasterStack
  plainview(poppendorf, r = 4, g = 3, b = 2) # true color
  plainview(poppendorf, r = 5, g = 4, b = 3) # false color

}




