library(s2dverification)


### Name: ArrayToNetCDF
### Title: Save multidimensional R arrays into NetCDF files
### Aliases: ArrayToNetCDF
### Keywords: datagen

### ** Examples

  ## Not run: 
##D # Minimal use case
##D ArrayToNetCDF(array(1:9, c(3, 3)), 'tmp.nc')
##D 
##D # Works with arrays of any number of dimensions
##D ArrayToNetCDF(array(1:27, c(3, 3, 3)), 'tmp.nc')
##D 
##D # Arrays can also be provided in [named] lists
##D ArrayToNetCDF(list(tos = array(1:27, c(3, 3, 3))), 'tmp.nc')
##D 
##D # Or with dimension names
##D # 'var' dimension name will generate multiple variables in the 
##D # resulting NetCDF file
##D a <- array(1:27, dim = c(3, 3, 3))
##D names(dim(a)) <- c('lon', 'lat', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # 'variable' as dimension name will do the same
##D a <- array(1:27, dim = c(3, 3, 3))
##D names(dim(a)) <- c('lon', 'lat', 'variable')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # The 'time' dimension will be built as unlimited dimension, by default
##D a <- array(1:1600, dim = c(10, 20, 4, 2))
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # Putting the 'time' dimension in a position which is not the last, or the one
##D # right before 'var'/'variable' will crash. Unlimited dimension must be in the
##D # last position
##D a <- array(1:1600, dim = c(10, 20, 4, 2))
##D names(dim(a)) <- c('time', 'lat', 'lon', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D a <- array(1:1600, dim = c(10, 20, 4, 2))
##D names(dim(a)) <- c('lat', 'time', 'lon', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # The dimension 'var'/'variable' can be in any position and can have any length
##D a <- array(1:1600, dim = c(10, 20, 4, 2))
##D names(dim(a)) <- c('lat', 'var', 'lon', 'time')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # Multiple arrays can be provided in a list
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(list(a, a), 'tmp.nc')
##D 
##D # If no dimension names are given to an array, new names will be automatically
##D # generated
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D b <- array(1:400, dim = c(5, 11, 4, 2))
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(list(a, b), 'tmp.nc')
##D 
##D # If two arrays use a same dimension but their lengths differ, the function 
##D # will crash
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D b <- array(1:400, dim = c(5, 11, 4, 2))
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D names(dim(b)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(list(a, b), 'tmp.nc')
##D 
##D # Metadata can be provided for each variable in each array, via the
##D # attribute 'variables'. In this example the metadata is empty.
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D metadata <- list(
##D               tos = list(),
##D               tas = list()
##D             )
##D attr(a, 'variables') <- metadata
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # Variable names can be manually specified
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D metadata <- list(
##D               tos = list(name = 'name1'),
##D               tas = list(name = 'name2')
##D             )
##D attr(a, 'variables') <- metadata
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # Units can be specified
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D metadata <- list(
##D               tos = list(units = 'K'),
##D               tas = list(units = 'K')
##D             )
##D attr(a, 'variables') <- metadata
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # addOffset and scaleFactor can be specified
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D metadata <- list(
##D               tos = list(addOffset = 100,
##D                          scaleFact = 10),
##D               tas = list(addOffset = 100,
##D                          scaleFact = 10)
##D             )
##D attr(a, 'variables') <- metadata
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # Unlimited dimensions can be manually created
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D metadata <- list(
##D               tos = list(addOffset = 100,
##D                          scaleFact = 10,
##D                          dim = list(list(name = 'unlimited',
##D                                          unlim = TRUE))),
##D               tas = list(addOffset = 100,
##D                          scaleFact = 10,
##D                          dim = list(list(name = 'unlimited',
##D                                          unlim = TRUE)))
##D             )
##D attr(a, 'variables') <- metadata
##D names(dim(a)) <- c('lat', 'lon', 'unlimited', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # A 'time' dimension can be built without it necessarily being unlimited
##D a <- array(1:400, dim = c(5, 10, 4, 2))
##D metadata <- list(
##D               tos = list(addOffset = 100,
##D                          scaleFact = 10,
##D                          dim = list(list(name = 'time',
##D                                          unlim = FALSE))),
##D               tas = list(addOffset = 100,
##D                          scaleFact = 10,
##D                          dim = list(list(name = 'time',
##D                                          unlim = FALSE)))
##D             )
##D attr(a, 'variables') <- metadata
##D names(dim(a)) <- c('lat', 'lon', 'time', 'var')
##D ArrayToNetCDF(a, 'tmp.nc')
##D 
##D # Multiple arrays with data for multiple variables can be saved into a 
##D # NetCDF file at once.
##D tos <- array(1:400, dim = c(5, 10, 4))
##D metadata <- list(tos = list(units = 'K'))
##D attr(tos, 'variables') <- metadata
##D names(dim(tos)) <- c('lat', 'lon', 'time')
##D lon <- seq(0, 360 - 360 / 10, length.out = 10)
##D dim(lon) <- length(lon)
##D metadata <- list(lon = list(units = 'degrees_east'))
##D attr(lon, 'variables') <- metadata
##D names(dim(lon)) <- 'lon'
##D lat <- seq(-90, 90, length.out = 5)
##D dim(lat) <- length(lat)
##D metadata <- list(lat = list(units = 'degrees_north'))
##D attr(lat, 'variables') <- metadata
##D names(dim(lat)) <- 'lat'
##D ArrayToNetCDF(list(tos, lon, lat), 'tmp.nc')
##D   
## End(Not run)



