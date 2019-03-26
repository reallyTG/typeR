library(pbdNCDF4)


### Name: ncatt_put
### Title: Put an attribute into a netCDF file
### Aliases: ncatt_put
### Keywords: utilities

### ** Examples

## Not run: 
##D # Make a simple netCDF file
##D filename <- "atttest_types.nc"
##D dim <- ncdim_def( "X", "inches", 1:12 )
##D var <- ncvar_def( "Data", "unitless", dim, -1 ) 
##D ncnew <- nc_create( filename, var )
##D 
##D # Define some attributes of various types
##D attvaldbl <- 3.1415926536
##D ncatt_put( ncnew, var, "testatt_dbl", attvaldbl, prec="double" )
##D attvalfloat <- c(1.0,4.0,9.0,16.0)
##D ncatt_put( ncnew, var, "testatt_float", attvalfloat )
##D # varid=0 means it is a global attribute
##D ncatt_put( ncnew, 0, "globalatt_int", 32000, prec="int" ) 
##D ncatt_put( ncnew, 0, "globalatt_short", 7, prec="short" )
##D ncatt_put( ncnew, 0, "description", 
##D 	"this is a test file with attributes of various types")
##D nc_close(ncnew)
## End(Not run)



