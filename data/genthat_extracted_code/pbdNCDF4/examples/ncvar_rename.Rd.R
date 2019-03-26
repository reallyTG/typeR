library(pbdNCDF4)


### Name: ncvar_rename
### Title: Rename an Existing Variable in a netCDF File
### Aliases: ncvar_rename
### Keywords: utilities

### ** Examples

## Not run: 
##D #===================================================================
##D # PART 1.  MAKE A TEST NETCDF FILE THAT WE WILL MANIPULATE IN PART 2
##D #===================================================================
##D 
##D #----------------
##D # Make dimensions
##D #----------------
##D xvals <- 1:360
##D yvals <- -90:90
##D 
##D nx <- length(xvals)
##D ny <- length(yvals)
##D 
##D xdim <- ncdim_def( 'Lon', 'degreesE', xvals )
##D ydim <- ncdim_def( 'Lat', 'degreesE', yvals )
##D tdim <- ncdim_def( 'Time', 'days since 1900-01-01', 0, unlim=TRUE )
##D 
##D #---------
##D # Make var
##D #---------
##D mv <- 1.e30     # missing value
##D var_temp <- ncvar_def( 'Temperature', 'K', list(xdim,ydim,tdim), mv )
##D 
##D #---------------------
##D # Make new output file
##D #---------------------
##D output_fname <- 'test_real3d.nc'
##D ncid_new <- nc_create( output_fname, list(var_temp))
##D 
##D #-------------------------------
##D # Put some test data in the file
##D #-------------------------------
##D data_temp <- array(0.,dim=c(nx,ny,1))
##D for( j in 1:ny )
##D for( i in 1:nx )
##D         data_temp[i,j,1] <- sin(i/10)*sin(j/10)
##D 
##D ncvar_put( ncid_new, var_temp, data_temp, start=c(1,1,1), count=c(nx,ny,1))
##D 
##D #--------------------------
##D # Close our new output file
##D #--------------------------
##D nc_close( ncid_new )
##D 
##D #===========================================================================
##D # PART 2.  RENAME A NEW VARIABLE TO THE FILE
##D #===========================================================================
##D 
##D #-------------------------------------------------
##D # Open the existing file we're going to manipulate
##D #-------------------------------------------------
##D ncid_old <- nc_open( output_fname, write=TRUE )
##D 
##D old_varname <- 'Temperature'
##D new_varname <- 'T'
##D 
##D ncid_old <- ncvar_rename( ncid_old, old_varname, new_varname )
##D 
##D print(ncid_old)
##D 
##D nc_close( ncid_old )
## End(Not run)



