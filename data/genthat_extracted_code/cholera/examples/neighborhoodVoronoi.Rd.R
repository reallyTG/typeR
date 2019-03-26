library(cholera)


### Name: neighborhoodVoronoi
### Title: Compute Voronoi pump neighborhoods.
### Aliases: neighborhoodVoronoi

### ** Examples

neighborhoodVoronoi()
neighborhoodVoronoi(vestry = TRUE)
neighborhoodVoronoi(pump.select = 6:7)
neighborhoodVoronoi(pump.select = -6)
neighborhoodVoronoi(pump.select = -6, polygon.vertices = TRUE)

# coordinates for vertices also available in the returned object.
dat <- neighborhoodVoronoi(pump.select = -6)
dat$coordinates



