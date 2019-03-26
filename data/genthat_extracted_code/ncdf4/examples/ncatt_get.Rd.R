library(ncdf4)


### Name: ncatt_get
### Title: Get attribute from netCDF file
### Aliases: ncatt_get
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

# Now illustrate the use of the ncatt_get function by reading them back in
doitfor <- function( nc, var, attname ) {
	av <- ncatt_get( nc, var, attname )
	if( av$hasatt ) {
		print(paste("File",nc$filename,", var",var,"DOES have attribute",
				attname))
		print(paste("Storage mode:",storage.mode(av$value)))
		print("Attribute value:")
		print(av$value)
	} else {
		print(paste("File",nc$filename,", var",var,"does NOT have",
			"attribute", attname))
		}
}
	
nc <- nc_open( filename )
var <- "Data"
doitfor( nc, var, "testatt_dbl" )
doitfor( nc, var, "testatt_float" )
doitfor( nc, var, "testatt_wacko" )
doitfor( nc, 0,   "globalatt_int" )
doitfor( nc, 0,   "globalatt_short" )
doitfor( nc, 0,   "description" )



