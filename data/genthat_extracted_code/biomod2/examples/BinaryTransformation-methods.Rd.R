library(biomod2)


### Name: BinaryTransformation
### Title: Convert species' probability of occurrence into binary
###   presence-absence data using a predefined threshold
### Aliases: BinaryTransformation BinaryTransformation,
###   BinaryTransformation,RasterBrick-method
###   BinaryTransformation,RasterLayer-method
###   BinaryTransformation,RasterStack-method
###   BinaryTransformation,array-method
###   BinaryTransformation,data.frame-method
###   BinaryTransformation,matrix-method
###   BinaryTransformation,numeric-method RasterBrick-method
###   RasterLayer-method RasterStack-method array-method data.frame-method
###   matrix-method numeric-method
### Keywords: models

### ** Examples

  xx <- rnorm(50,10)
  yy <- BinaryTransformation(xx, 10)

  cbind(xx,yy)




