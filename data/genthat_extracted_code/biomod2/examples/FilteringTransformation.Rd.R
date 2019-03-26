library(biomod2)


### Name: FilteringTransformation
### Title: Convert species' probability of occurrence into binary
###   presence-absence data using a predefined threshold
### Aliases: FilteringTransformation FilteringTransformation-methods
###   FilteringTransformation,data.frame-method
###   FilteringTransformation,matrix-method
###   FilteringTransformation,numeric-method
###   FilteringTransformation,array-method
###   FilteringTransformation,RasterBrick-method
###   FilteringTransformation,RasterLayer-method
###   FilteringTransformation,RasterStack-method
### Keywords: models

### ** Examples


xx <- rnorm(50,10)
yy <- FilteringTransformation(xx, 10)

cbind(xx,yy)




