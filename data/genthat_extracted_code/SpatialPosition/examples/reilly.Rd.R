library(SpatialPosition)


### Name: reilly
### Title: Reilly Catchment Areas
### Aliases: reilly

### ** Examples

# Create a SpatialPointsDataFrame grid of spatMask extent and 200 meters 
# resolution
data(spatData)
mygrid <- CreateGrid(w = spatMask, resolution = 200)
# Create a distance matrix between known points (spatPts) and mygrid
mymat <- CreateDistMatrix(knownpts = spatPts, unknownpts = mygrid)
# Compute Reilly catchment areas from known points (spatPts) on a given 
# grid (mygrid) using a given distance matrix (mymat)
myreilly2 <- reilly(knownpts = spatPts, unknownpts = mygrid, 
               matdist = mymat, varname = "Capacite", 
               typefct = "exponential", span = 1250, 
               beta = 3, mask = spatMask)
row.names(spatPts) <- spatPts$CodHop
# Compute Reilly catchment areas from known points (spatPts) on a 
# grid defined by its resolution
myreilly <- reilly(knownpts = spatPts, varname = "Capacite", 
                typefct = "exponential", span = 1250, beta = 3, 
                resolution = 200, mask = spatMask)
# The function output a SpatialPointsDataFrame
class(myreilly)
# The OUTPUT field values match knownpts row names
head(unique(myreilly$OUTPUT))



