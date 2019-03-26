library(s2dverification)


### Name: CDORemap
### Title: Interpolates arrays with longitude and latitude dimensions using
###   CDO
### Aliases: CDORemap
### Keywords: datagen

### ** Examples

  ## Not run: 
##D # Interpolating only vectors of longitudes and latitudes
##D lon <- seq(0, 360 - 360/50, length.out = 50)
##D lat <- seq(-90, 90, length.out = 25)
##D tas2 <- CDORemap(NULL, lon, lat, 't170grid', 'bil', TRUE)
##D 
##D # Minimal array interpolation
##D tas <- array(1:50, dim = c(25, 50))
##D names(dim(tas)) <- c('lat', 'lon')
##D lon <- seq(0, 360 - 360/50, length.out = 50)
##D lat <- seq(-90, 90, length.out = 25)
##D tas2 <- CDORemap(tas, lon, lat, 't170grid', 'bil', TRUE)
##D 
##D # Metadata can be attached to the inputs. It will be preserved and 
##D # accordignly modified.
##D tas <- array(1:50, dim = c(25, 50))
##D names(dim(tas)) <- c('lat', 'lon')
##D lon <- seq(0, 360 - 360/50, length.out = 50)
##D metadata <- list(lon = list(units = 'degrees_east'))
##D attr(lon, 'variables') <- metadata
##D lat <- seq(-90, 90, length.out = 25)
##D metadata <- list(lat = list(units = 'degrees_north'))
##D attr(lat, 'variables') <- metadata
##D metadata <- list(tas = list(dim = list(lat = list(len = 25,
##D                                                   vals = lat),
##D                                        lon = list(len = 50,
##D                                                   vals = lon)
##D                                       )))
##D attr(tas, 'variables') <- metadata
##D tas2 <- CDORemap(tas, lon, lat, 't170grid', 'bil', TRUE)
##D 
##D # Arrays of any number of dimensions in any order can be provided.
##D num_lats <- 25
##D num_lons <- 50
##D tas <- array(1:(10*num_lats*10*num_lons*10), 
##D              dim = c(10, num_lats, 10, num_lons, 10))
##D names(dim(tas)) <- c('a', 'lat', 'b', 'lon', 'c')
##D lon <- seq(0, 360 - 360/num_lons, length.out = num_lons)
##D metadata <- list(lon = list(units = 'degrees_east'))
##D attr(lon, 'variables') <- metadata
##D lat <- seq(-90, 90, length.out = num_lats)
##D metadata <- list(lat = list(units = 'degrees_north'))
##D attr(lat, 'variables') <- metadata
##D metadata <- list(tas = list(dim = list(a = list(),
##D                                        lat = list(len = num_lats,
##D                                                   vals = lat),
##D                                        b = list(),
##D                                        lon = list(len = num_lons,
##D                                                   vals = lon),
##D                                        c = list()
##D                                       )))
##D attr(tas, 'variables') <- metadata
##D tas2 <- CDORemap(tas, lon, lat, 't17grid', 'bil', TRUE)
##D # The step of permutation can be avoided but more intermediate file writes
##D # will be performed.
##D tas2 <- CDORemap(tas, lon, lat, 't17grid', 'bil', FALSE)
##D 
##D # If the provided array has the longitude or latitude dimension in the 
##D # right-most position, the same number of file writes will be performed,
##D # even if avoid_wrties = FALSE.
##D num_lats <- 25
##D num_lons <- 50
##D tas <- array(1:(10*num_lats*10*num_lons*10), 
##D              dim = c(10, num_lats, 10, num_lons))
##D names(dim(tas)) <- c('a', 'lat', 'b', 'lon')
##D lon <- seq(0, 360 - 360/num_lons, length.out = num_lons)
##D metadata <- list(lon = list(units = 'degrees_east'))
##D attr(lon, 'variables') <- metadata
##D lat <- seq(-90, 90, length.out = num_lats)
##D metadata <- list(lat = list(units = 'degrees_north'))
##D attr(lat, 'variables') <- metadata
##D metadata <- list(tas = list(dim = list(a = list(),
##D                                        lat = list(len = num_lats,
##D                                                   vals = lat),
##D                                        b = list(),
##D                                        lon = list(len = num_lons,
##D                                                   vals = lon)
##D                                       )))
##D attr(tas, 'variables') <- metadata
##D tas2 <- CDORemap(tas, lon, lat, 't17grid', 'bil', TRUE)
##D tas2 <- CDORemap(tas, lon, lat, 't17grid', 'bil', FALSE)
##D 
##D # An example of an interpolation from and onto a rectangular regular grid
##D num_lats <- 25
##D num_lons <- 50
##D tas <- array(1:(1*num_lats*num_lons), dim = c(num_lats, num_lons))
##D names(dim(tas)) <- c('y', 'x')
##D lon <- array(seq(0, 360 - 360/num_lons, length.out = num_lons), 
##D              dim = c(num_lons, num_lats))
##D metadata <- list(lon = list(units = 'degrees_east'))
##D names(dim(lon)) <- c('x', 'y')
##D attr(lon, 'variables') <- metadata
##D lat <- t(array(seq(-90, 90, length.out = num_lats), 
##D                dim = c(num_lats, num_lons)))
##D metadata <- list(lat = list(units = 'degrees_north'))
##D names(dim(lat)) <- c('x', 'y')
##D attr(lat, 'variables') <- metadata
##D tas2 <- CDORemap(tas, lon, lat, 'r100x50', 'bil')
##D 
##D # An example of an interpolation from an irregular grid onto a gaussian grid
##D num_lats <- 25
##D num_lons <- 50
##D tas <- array(1:(10*num_lats*10*num_lons*10), 
##D              dim = c(10, num_lats, 10, num_lons))
##D names(dim(tas)) <- c('a', 'j', 'b', 'i')
##D lon <- array(seq(0, 360 - 360/num_lons, length.out = num_lons), 
##D              dim = c(num_lons, num_lats))
##D metadata <- list(lon = list(units = 'degrees_east'))
##D names(dim(lon)) <- c('i', 'j')
##D attr(lon, 'variables') <- metadata
##D lat <- t(array(seq(-90, 90, length.out = num_lats), 
##D          dim = c(num_lats, num_lons)))
##D metadata <- list(lat = list(units = 'degrees_north'))
##D names(dim(lat)) <- c('i', 'j')
##D attr(lat, 'variables') <- metadata
##D tas2 <- CDORemap(tas, lon, lat, 't17grid', 'bil')
##D 
##D # Again, the dimensions can be in any order
##D num_lats <- 25
##D num_lons <- 50
##D tas <- array(1:(10*num_lats*10*num_lons), 
##D              dim = c(10, num_lats, 10, num_lons))
##D names(dim(tas)) <- c('a', 'j', 'b', 'i')
##D lon <- array(seq(0, 360 - 360/num_lons, length.out = num_lons), 
##D              dim = c(num_lons, num_lats))
##D names(dim(lon)) <- c('i', 'j')
##D lat <- t(array(seq(-90, 90, length.out = num_lats), 
##D                dim = c(num_lats, num_lons)))
##D names(dim(lat)) <- c('i', 'j')
##D tas2 <- CDORemap(tas, lon, lat, 't17grid', 'bil')
##D tas2 <- CDORemap(tas, lon, lat, 't17grid', 'bil', FALSE)
##D # It is ossible to specify an external NetCDF file as target grid reference
##D tas2 <- CDORemap(tas, lon, lat, 'external_file.nc', 'bil')
##D   
## End(Not run)



