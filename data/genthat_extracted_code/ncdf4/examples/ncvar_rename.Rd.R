library(ncdf4)


### Name: ncvar_rename
### Title: Rename an Existing Variable in a netCDF File
### Aliases: ncvar_rename
### Keywords: utilities

### ** Examples

#===================================================================
# PART 1.  MAKE A TEST NETCDF FILE THAT WE WILL MANIPULATE IN PART 2
#===================================================================

#----------------
# Make dimensions
#----------------
xvals <- 1:360
yvals <- -90:90

nx <- length(xvals)
ny <- length(yvals)

xdim <- ncdim_def( 'Lon', 'degreesE', xvals )
ydim <- ncdim_def( 'Lat', 'degreesE', yvals )
tdim <- ncdim_def( 'Time', 'days since 1900-01-01', 0, unlim=TRUE )

#---------
# Make var
#---------
mv <- 1.e30     # missing value
var_temp <- ncvar_def( 'Temperature', 'K', list(xdim,ydim,tdim), mv )

#---------------------
# Make new output file
#---------------------
output_fname <- 'test_real3d.nc'
ncid_new <- nc_create( output_fname, list(var_temp))

#-------------------------------
# Put some test data in the file
#-------------------------------
data_temp <- array(0.,dim=c(nx,ny,1))
for( j in 1:ny )
for( i in 1:nx )
        data_temp[i,j,1] <- sin(i/10)*sin(j/10)

ncvar_put( ncid_new, var_temp, data_temp, start=c(1,1,1), count=c(nx,ny,1))

#--------------------------
# Close our new output file
#--------------------------
nc_close( ncid_new )

#===========================================================================
# PART 2.  RENAME A NEW VARIABLE TO THE FILE
#===========================================================================

#-------------------------------------------------
# Open the existing file we're going to manipulate
#-------------------------------------------------
ncid_old <- nc_open( output_fname, write=TRUE )

old_varname <- 'Temperature'
new_varname <- 'T'

ncid_old <- ncvar_rename( ncid_old, old_varname, new_varname )

print(ncid_old)

nc_close( ncid_old )



