library(eseis)


### Name: spatial_migrate
### Title: Migrate signals of a seismic event through a grid of locations.
### Aliases: spatial_migrate

### ** Examples


## Not run: 
##D 
##D ## create synthetic DEM
##D dem <- raster::raster(nrows = 20, ncols = 20, 
##D                       xmn = 0, xmx = 10000, 
##D                       ymn= 0, ymx = 10000, 
##D                       vals = rep(0, 400))
##D 
##D ## define station coordinates
##D sta <- data.frame(x = c(1000, 9000, 5000),
##D                   y = c(1000, 1000, 9000),
##D                   ID = c("A", "B", "C"))
##D 
##D ## create synthetic signal (source in the center of the DEM)
##D s <- rbind(dnorm(x = 1:1000, mean = 400, sd = 50),
##D            dnorm(x = 1:1000, mean = 400, sd = 50),
##D            dnorm(x = 1:1000, mean = 400, sd = 50))
##D 
##D ## plot DEM and stations
##D raster::plot(dem)
##D 
##D text(x = sta$x, 
##D      y = sta$y, 
##D      labels = sta$ID)
##D 
##D ## calculate spatial distance maps and inter-station distances
##D D <- eseis::spatial_distance(stations = sta[,1:2],
##D                              dem = dem)
##D 
##D ## locate signal
##D e <- eseis::spatial_migrate(data = s, 
##D                             d_stations = D$stations, 
##D                             d_map = D$maps, 
##D                             v = 1000, 
##D                             dt = 1/10)
##D 
##D ## get most likely location coordinates
##D xy <- sp::coordinates(e)[raster::values(e) == max(raster::values(e))]
##D 
##D ## plot location estimate, most likely location estimate and stations
##D raster::plot(e)
##D points(xy[1], 
##D        xy[2],
##D        pch = 20)
##D points(sta[,1:2])
##D 
## End(Not run)




