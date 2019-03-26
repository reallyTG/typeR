library(GSIF)


### Name: fit.vgmModel-methods
### Title: Fits a 2D or 3D variogram model to spatial data
### Aliases: fit.vgmModel
###   fit.vgmModel,formula,data.frame,SpatialPixelsDataFrame-method

### ** Examples

library(sp)
library(gstat)

## fit variogram to the Meuse data:
demo(meuse, echo=FALSE)
# produce a regression matrix:
ov <- over(meuse, meuse.grid)
ov <- cbind(data.frame(meuse["om"]), ov)
# fit a model:
v <- fit.vgmModel(om~1, rmatrix=ov, meuse.grid, dimensions="2D")
plot(variogram(om ~ 1, meuse[!is.na(meuse$om),]), v$vgm)



