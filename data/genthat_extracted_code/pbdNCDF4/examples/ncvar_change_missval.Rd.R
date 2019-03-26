library(pbdNCDF4)


### Name: ncvar_change_missval
### Title: Change the Missing Value For a netCDF Variable
### Aliases: ncvar_change_missval
### Keywords: utilities

### ** Examples

## Not run: 
##D # Make an example netCDF file with a given missing value.  We will
##D # then change the missing value in the file using ncvar_change_missval
##D 
##D origMissVal <- -1.
##D dimX   <- ncdim_def( "X", "meters", 1:7 )
##D varAlt <- ncvar_def( "Altitude", "km", dimX, origMissVal )
##D ncnew  <- nc_create( "transect.nc", varAlt )
##D data <- c(10.,2.,NA,1.,7.,NA,8.)
##D ncvar_put( ncnew, varAlt, data )
##D nc_close(ncnew)
##D 
##D # At this point, the actual data values in the netCDF
##D # file will be: 10 2 -1 1 7 -1 8
##D # because the "NA" values were filled with the missing
##D # value, -1.  Also, the missing_value attribute of variable
##D # "varAlt" will be equal to -1.
##D 
##D # Now change the missing value to something else.  Remember
##D # we have to open the file as writable to be able to change
##D # the missing value on disk!
##D 
##D newMissVal <- 999.9
##D nc <- nc_open( "transect.nc", write=TRUE )
##D varname <- "Altitude"
##D data <- ncvar_get( nc, varname )  # data now has: 10., 2., NA, 1., 7., NA, 8.
##D print(data)
##D ncvar_change_missval( nc, varname, newMissVal )
##D ncvar_put( nc, varname, data )
##D nc_close(nc)
##D 
##D # Now, the actual data values in the netCDF file will be:
##D # 10 2 999.9 1 7 999.9 8
##D # and the variables "missing_value" attributre will be 999.9
##D 
##D # **NOTE** that we had to explicitly read in the data and write
##D # it out again in order for the on-disk missing values in the
##D # data array to change!  The on-disk missing_value attribute for
##D # the variable is set automatically by this function, but it is 
##D # up to you whether or not you want to read in all the existing
##D # data and change the values to the new missing value.
## End(Not run)



