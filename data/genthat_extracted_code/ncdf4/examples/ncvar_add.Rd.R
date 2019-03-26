library(ncdf4)


### Name: ncvar_add
### Title: Add New netCDF Variable to Existing File
### Aliases: ncvar_add
### Keywords: utilities

### ** Examples

#===========================================================================
# PART 1.  MAKE A TEST NETCDF FILE THAT WE WILL ADD A VARIABLE TO IN PART 2.
#===========================================================================

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
# PART 2.  ADD A NEW VARIABLE TO THE FILE
#===========================================================================

#---------------------------------------------------
# Open the existing file we're going to add a var to
#---------------------------------------------------
ncid_old <- nc_open( output_fname, write=TRUE )

#------------------------------------------------------------------
# Make a NEW variable to put into the file.  Have this new variable
# use the same dimensions already in the file
#------------------------------------------------------------------
xdim2 <- ncid_old$dim[['Lon']]
ydim2 <- ncid_old$dim[['Lat']]
tdim2 <- ncid_old$dim[['Time']]
mv2 <- 1.e30
var_q <- ncvar_def( 'Humidity', 'g/kg', list(xdim2,ydim2,tdim2), mv2 )

ncid_old <- ncvar_add( ncid_old, var_q )	# NOTE this returns a modified netcdf file handle 

#-------------------------------------------------------------------
# Make a DIFFERENT new var that will be added to the file.  This var
# uses a dim that does NOT already exist in the file.
#-------------------------------------------------------------------
zdim   <- ncdim_def( 'Level', 'hPa', seq(1000,100,by=-100))
var_cf <- ncvar_def( 'CloudFraction', 'percent', list(xdim2,ydim2,zdim,tdim2), mv2 )

ncid_old <- ncvar_add( ncid_old, var_cf )

print(ncid_old)

nc_close( ncid_old )



