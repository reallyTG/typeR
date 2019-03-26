library(intamapInteractive)


### Name: doSegmentation
### Title: Spatial Segmentation - Clustering for Scattered Observations
### Aliases: doSegmentation
### Keywords: spatial

### ** Examples

library(gstat)

data(walker)
# coordinates(walker)=~X+Y
object=createIntamapObject(observations=walker)
object=doSegmentation(object)

print(summary(object$clusters$index))






