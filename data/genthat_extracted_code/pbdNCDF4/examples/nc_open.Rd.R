library(pbdNCDF4)


### Name: nc_open
### Title: Open a netCDF File
### Aliases: nc_open
### Keywords: utilities

### ** Examples

## Not run: 
##D # Define an integer dimension 
##D dimState <- ncdim_def( "StateNo", "count", 1:50 )
##D 
##D # Make an integer variable.  Note that an integer variable can have
##D # a double precision dimension, or vice versa; there is no fixed
##D # relationship between the precision of the dimension and that of the
##D # associated variable.  We just make an integer variable here for
##D # illustration purposes.
##D varPop <- ncvar_def("Pop", "count", dimState, -1, 
##D 	longname="Population", prec="integer")
##D 
##D # Create a netCDF file with this variable
##D ncnew <- nc_create( "states_population.nc", varPop )
##D 
##D # Write some values to this variable on disk.
##D popAlabama <- 4447100
##D ncvar_put( ncnew, varPop, popAlabama, start=1, count=1 )
##D 
##D # Add source info metadata to file
##D ncatt_put( ncnew, 0, "source", "Census 2000 from census bureau web site")
##D 
##D nc_close(ncnew)
##D 
##D # Now open the file and read its data
##D ncold <- nc_open("states_population.nc")
##D data <- ncvar_get(ncold)
##D print("here is the data in the file:")
##D print(data)
##D nc_close( ncold )
## End(Not run)



