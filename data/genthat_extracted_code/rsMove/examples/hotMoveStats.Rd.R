library(rsMove)


### Name: hotMoveStats
### Title: hotMoveStats
### Aliases: hotMoveStats

### ** Examples

{

require(raster)

# reference data
data(longMove)

# extract regions
hm <- hotMove(longMove, 0.1)

# add new information to original shapefile
longMove@data <- cbind(longMove@data, hm$region.id)

# derive statistics
hm.region.stats <- hotMoveStats(hm$region.id, as.Date(longMove@data$timestamp))

}



