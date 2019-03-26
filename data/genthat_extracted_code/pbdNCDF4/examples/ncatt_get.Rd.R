library(pbdNCDF4)


### Name: ncatt_get
### Title: Get attribute from netCDF file
### Aliases: ncatt_get
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
##D 
##D # Now illustrate the use of the ncatt_get function by reading them back in
##D doitfor <- function( nc, var, attname ) {
##D 	av <- ncatt_get( nc, var, attname )
##D 	if( av$hasatt ) {
##D 		print(paste("File",nc$filename,", var",var,"DOES have attribute",
##D 				attname))
##D 		print(paste("Storage mode:",storage.mode(av$value)))
##D 		print("Attribute value:")
##D 		print(av$value)
##D 	} else {
##D 		print(paste("File",nc$filename,", var",var,"does NOT have",
##D 			"attribute", attname))
##D 		}
##D }
##D 	
##D nc <- nc_open( filename )
##D var <- "Data"
##D doitfor( nc, var, "testatt_dbl" )
##D doitfor( nc, var, "testatt_float" )
##D doitfor( nc, var, "testatt_wacko" )
##D doitfor( nc, 0,   "globalatt_int" )
##D doitfor( nc, 0,   "globalatt_short" )
##D doitfor( nc, 0,   "description" )
## End(Not run)



