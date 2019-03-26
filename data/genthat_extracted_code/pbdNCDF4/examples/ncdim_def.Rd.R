library(pbdNCDF4)


### Name: ncdim_def
### Title: Define a netCDF Dimension
### Aliases: ncdim_def
### Keywords: utilities

### ** Examples

## Not run: 
##D # Define some straightforward dimensions
##D x <- ncdim_def( "Lon", "degreesE", 0.5:359.5)
##D y <- ncdim_def( "Lat", "degreesN", as.double(-89:89))
##D t <- ncdim_def( "Time", "days since 1900-01-01", 1:10, unlim=TRUE)
##D 
##D # Make a variable with those dimensions.  Note order: time is LAST
##D salinity <- ncvar_def("Salinity",    "ppt",  list(x,y,t), 1.e30 )
##D 
##D # Create a netCDF file with this variable
##D ncnew <- nc_create( "salinity.nc", salinity )
##D 
##D nc_close(ncnew)
##D 
##D # Now, illustrate some manipulations of the ncdim object.
##D filename <- "salinity.nc"
##D nc <- nc_open( filename )
##D print(paste("File",filename,"contains",nc$ndims,"dimensions"))
##D for( i in 1:nc$ndims ) {
##D 	print(paste("Here is information about dimension number",i,":"))
##D 	d <- nc$dim[[i]]
##D 	print(paste("    Name  :",d$name))
##D 	print(paste("    Units :",d$units))
##D 	print(paste("    Length:",d$len))
##D 	print("    Values:")
##D 	print(d$vals)
##D 	print(paste("    Unlimited:",d$unlim))
##D 	}
## End(Not run)



