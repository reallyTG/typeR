library(eseis)


### Name: spatial_distance
### Title: Calculate topography-corrected distances for seismic waves.
### Aliases: spatial_distance
### Keywords: eseis

### ** Examples

## Not run: 
##D ## load and aggregate example DEM
##D data("volcano")
##D dem <- raster::raster(volcano)
##D dem <- raster::aggregate(x = dem, 2) * 10
##D dem@extent <- dem@extent * 1000
##D dem@extent <- dem@extent + c(510, 510, 510, 510)
##D 
##D ## define example stations
##D stations <- cbind(c(200, 700), c(220, 700))
##D 
##D ## plot example data
##D raster::plot(dem)
##D points(stations[,1], stations[,2])
##D 
##D ## calculate distance matrices and stations distances
##D D <- spatial_distance(stations = stations, 
##D                       dem = dem, 
##D                       topography = TRUE, 
##D                       cores = 1)
##D 
##D ## plot distance map for station 2
##D raster::plot(D$maps[[2]])
##D 
##D ## show station distance matrix
##D print(D$stations)
##D 
##D ## run with small aoi
##D D <- spatial_distance(stations = stations, 
##D                       dem = dem, 
##D                       topography = TRUE, 
##D                       cores = 1, 
##D                       aoi = c(400, 600, 600, 800))
## End(Not run) 
                                          



