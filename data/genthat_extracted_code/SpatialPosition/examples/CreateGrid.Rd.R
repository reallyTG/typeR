library(SpatialPosition)


### Name: CreateGrid
### Title: Create a Regularly Spaced SpatialPointsDataFrame
### Aliases: CreateGrid

### ** Examples

# Create a SpatialPointsDataFrame grid of spatMask extent and 200 meters 
# resolution
data(spatData)
mygrid <- CreateGrid(w = spatMask, resolution = 200)
plot(mygrid, cex = 0.1, pch = ".")
plot(spatMask, border="red", lwd = 2, add = TRUE)



