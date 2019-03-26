library(dismo)


### Name: predict
### Title: Distribution model predictions
### Aliases: predict predict,Bioclim-method predict,Domain-method
###   predict,Mahalanobis-method predict,MaxEnt-method
###   predict,MaxEntReplicates-method predict,ConvexHull-method
###   predict,CircleHull-method predict,RectangularHull-method
###   predict,CirclesRange-method predict,GeographicDistance-method
###   predict,InvDistWeightModel-method predict,VoronoiHull-method
### Keywords: methods spatial

### ** Examples

logo <- stack(system.file("external/rlogo.grd", package="raster"))
pts <- matrix(c(48, 48, 48, 53, 50, 46, 54, 70, 84, 85, 74, 84, 95, 85, 66, 
   42, 26, 4, 19, 17, 7, 14, 26, 29, 39, 45, 51, 56, 46, 38, 31, 22, 34, 60,
   70, 73, 63, 46, 43, 28), ncol=2)
b <- bioclim(logo, pts)
# prediction for a sub-region
e <- extent(30,90,20,60)
p <- predict(b, logo, progress='text', ext=e)
plot(p)



