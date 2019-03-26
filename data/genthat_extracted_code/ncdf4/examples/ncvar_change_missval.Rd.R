library(ncdf4)


### Name: ncvar_change_missval
### Title: Change the Missing Value For a netCDF Variable
### Aliases: ncvar_change_missval
### Keywords: utilities

### ** Examples

# Make an example netCDF file with a given missing value.  We will
# then change the missing value in the file using ncvar_change_missval

origMissVal <- -1.
dimX   <- ncdim_def( "X", "meters", 1:7 )
varAlt <- ncvar_def( "Altitude", "km", dimX, origMissVal )
ncnew  <- nc_create( "transect.nc", varAlt )
data <- c(10.,2.,NA,1.,7.,NA,8.)
ncvar_put( ncnew, varAlt, data )
nc_close(ncnew)

# At this point, the actual data values in the netCDF
# file will be: 10 2 -1 1 7 -1 8
# because the "NA" values were filled with the missing
# value, -1.  Also, the missing_value attribute of variable
# "varAlt" will be equal to -1.

# Now change the missing value to something else.  Remember
# we have to open the file as writable to be able to change
# the missing value on disk!

newMissVal <- 999.9
nc <- nc_open( "transect.nc", write=TRUE )
varname <- "Altitude"
data <- ncvar_get( nc, varname )  # data now has: 10., 2., NA, 1., 7., NA, 8.
print(data)
ncvar_change_missval( nc, varname, newMissVal )
ncvar_put( nc, varname, data )
nc_close(nc)

# Now, the actual data values in the netCDF file will be:
# 10 2 999.9 1 7 999.9 8
# and the variables "missing_value" attributre will be 999.9

# **NOTE** that we had to explicitly read in the data and write
# it out again in order for the on-disk missing values in the
# data array to change!  The on-disk missing_value attribute for
# the variable is set automatically by this function, but it is 
# up to you whether or not you want to read in all the existing
# data and change the values to the new missing value.



