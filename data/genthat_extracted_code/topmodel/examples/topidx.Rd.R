library(topmodel)


### Name: topidx
### Title: Calculation of the topographic index from a DEM raster
### Aliases: topidx
### Keywords: models

### ** Examples

  data(huagrahuma.dem)
  topidx <- topidx(huagrahuma.dem, resolution= 25)$atb
  image(topidx)



