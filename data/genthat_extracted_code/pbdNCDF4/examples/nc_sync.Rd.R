library(pbdNCDF4)


### Name: nc_sync
### Title: Synchronize (flush to disk) a netCDF File
### Aliases: nc_sync
### Keywords: utilities

### ** Examples

## Not run: 
##D # The time you would use the sync.ncdf function is when you have an unlimited
##D # dimension and are writing to the file timestep-by-timestep. Make a netCDF file 
##D # that has an unlimited dimension for illustration.
##D nx <- 5
##D ny <- 8
##D dimx <- ncdim_def( "X", "meters", 1:nx )
##D dimy <- ncdim_def( "Y", "meters", 1:ny )
##D dimt <- ncdim_def( "Time", "days since 1900-01-01", 0, unlim=TRUE )
##D 
##D vartemp <- ncvar_def( "Temperature", "degC", list(dimx,dimy,dimt), 1.e30 )
##D nc  <- nc_create( "temperature.nc", vartemp )
##D 
##D nt <- 10  # Imagine this is actually some very large number of timesteps
##D for( i in 1:nt ) {
##D 	# Long, slow computation to get the data ... for illustration, we just
##D 	# use the following:
##D 	data <- runif(nx*ny)
##D 
##D 	# Write the data to this timestep
##D 	ncvar_put( nc, vartemp, data, start=c(1,1,i), count=c(nx,ny,1) )
##D 
##D 	# Write the time value for this timestep as well
##D 	timeval <- i*10
##D 	ncvar_put( nc, dimt, timeval, start=i, count=1 )
##D 
##D 	# Flush this timestep's data to the file so we dont lose it
##D 	# if there is a crash or other problem
##D 	nc_sync( nc )
##D 	}
##D 
##D # Always remember to close the file when done!!
##D nc_close(nc)
## End(Not run)



