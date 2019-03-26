library(ncdf4)


### Name: ncatt_put
### Title: Put an attribute into a netCDF file
### Aliases: ncatt_put
### Keywords: utilities

### ** Examples

# Make a simple netCDF file
filename <- "atttest_types.nc"
dim <- ncdim_def( "X", "inches", 1:12 )
var <- ncvar_def( "Data", "unitless", dim, -1 ) 
ncnew <- nc_create( filename, var )

# Define some attributes of various types
attvaldbl <- 3.1415926536
ncatt_put( ncnew, var, "testatt_dbl", attvaldbl, prec="double" )
attvalfloat <- c(1.0,4.0,9.0,16.0)
ncatt_put( ncnew, var, "testatt_float", attvalfloat )
# varid=0 means it is a global attribute
ncatt_put( ncnew, 0, "globalatt_int", 32000, prec="int" ) 
ncatt_put( ncnew, 0, "globalatt_short", 7, prec="short" )
ncatt_put( ncnew, 0, "description", 
	"this is a test file with attributes of various types")
nc_close(ncnew)



