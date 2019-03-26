library(SpatialPosition)


### Name: smoothy
### Title: Stewart Smooth
### Aliases: smoothy

### ** Examples

# Create a SpatialPointsDataFrame grid of spatMask extent and 200 meters 
# resolution
data(spatData)
mygrid <- CreateGrid(w = spatMask, resolution = 200)
# Create a distance matrix between known points (spatPts) and mygrid
mymat <- CreateDistMatrix(knownpts = spatPts, unknownpts = mygrid)
# Compute Stewart potentials from known points (spatPts) on a given 
# grid (mygrid) using a given distance matrix (mymat)
mystewart <- smoothy(knownpts = spatPts, unknownpts = mygrid, 
                     matdist = mymat, varname = "Capacite", 
                     typefct = "exponential", span = 1250, 
                     beta = 3, mask = spatMask)
# Compute Stewart potentials from known points (spatPts) on a 
# grid defined by its resolution
mystewart2 <- smoothy(knownpts = spatPts, varname = "Capacite", 
                      typefct = "exponential", span = 1250, beta = 3, 
                      resolution = 200, mask = spatMask)
# The two methods have the same result
identical(mystewart, mystewart2)
# the function output a SpatialPointsDataFrame
class(mystewart)
# Computed values
summary(mystewart$OUTPUT)



