library(sptemExp)


### Name: points2Raster
### Title: Generation of Grid Surface Using the predicted/Interpolated
###   Values
### Aliases: points2Raster
### Keywords: ~kwd1 ~kwd2

### ** Examples

  data("spointspre")
  praster=points2Raster(spointspre,"pre_m",dx=2000,dy=2000)
  raster::plot(praster)



