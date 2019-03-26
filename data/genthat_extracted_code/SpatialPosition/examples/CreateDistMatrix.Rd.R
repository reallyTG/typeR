library(SpatialPosition)


### Name: CreateDistMatrix
### Title: Create a Distance Matrix Between Two Sp Objects
### Aliases: CreateDistMatrix

### ** Examples

# Create a SpatialPointsDataFrame grid of spatMask extent and 200 meters 
# resolution
data(spatData)
mygrid <- CreateGrid(w = spatMask, resolution = 200)
# Create a distance matrix between known spatPts and mygrid
mymat <- CreateDistMatrix(knownpts = spatPts, unknownpts = mygrid)
mymat[1:5,1:5]
nrow(spatPts)
nrow(mygrid)
dim(mymat)



