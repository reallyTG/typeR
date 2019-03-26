library(ncdf4)


### Name: ncvar_put
### Title: Write data to a netCDF file
### Aliases: ncvar_put
### Keywords: utilities

### ** Examples

#--------------------------------
# Make a few dimensions we can use
#--------------------------------
nx <- 3
ny <- 4
nt <- 5
xvals <- (1:nx)*100.
dimX <- ncdim_def( "X", "meters", xvals )
dimY <- ncdim_def( "Y", "meters", (1:ny)*100. )
dimT <- ncdim_def( "Time", "seconds", (1:nt)/100., unlim=TRUE )

#-------------------------------------------------------------------
# Make varables of various dimensionality, for illustration purposes
#-------------------------------------------------------------------
mv <- 1.e30		# missing value to use
var1d <- ncvar_def( "var1d", "units", dimX, mv )
var2d <- ncvar_def( "var2d", "units", list(dimX,dimY), mv )
var3d <- ncvar_def( "var3d", "units", list(dimX,dimY,dimT), mv )

#---------------------
# Create the test file
#---------------------
nc <- nc_create( "writevals.nc", list(var1d,var2d,var3d) )

#----------------------------
# Write some data to the file
#----------------------------
data1d <- runif(nx)
ncvar_put( nc, var1d, data1d )	# no start or count: write all values
ncvar_put( nc, var1d, 27.5, start=3, count=1 ) # Write a value to the third slot

data2d <- runif(nx*ny)
ncvar_put( nc, var2d, data2d )	# no start or count: write all values

#--------------------------------
# Write a 1-d slice to the 2d var
#--------------------------------
ncvar_put( nc, var2d, data1d, start=c(1,2), count=c(nx,1) )	

#--------------------------------------------------------------
# Note how "-1" in the count means "the whole dimension length", 
# which equals nx in this case
#--------------------------------------------------------------
ncvar_put( nc, var2d, data1d, start=c(1,3), count=c(-1,1) )	

#-------------------------------------------------------------------------------
# The 3-d variable has an unlimited dimension.  We will loop over the timesteps,
# writing one 2-d slice per timestep.
#-------------------------------------------------------------------------------
for( i in 1:nt) 
	ncvar_put( nc, var3d, data2d, start=c(1,1,i), count=c(-1,-1,1) )

nc_close(nc)

#----------------------------------------------------------------------
# Illustrate creating a character type variable
#----------------------------------------------------------------------
cnames   <- c("red", "orange", "green", "yellow", "puce", "colorwithverylongname" )
nstrings <- length(cnames)

#--------------------------------------------------------------
# Make dimensions. Setting "dimnchar" to have a length of 12
# means that the maximum color name
# length can be 12.  Longer names will be truncated to this.
# We don't need dimvars for this example.
#--------------------------------------------------------------
dimnchar   <- ncdim_def("nchar",   "", 1:12, create_dimvar=FALSE )
dimcolorno <- ncdim_def("colorno", "", 1:nstrings, create_dimvar=FALSE )

#------------------------------------------------------------------------
# NOTE in the following call that units is set to the empty string (""),
# which suppresses creation of a units attribute, and the missing value
# is entirely omitted, which suppresses creation of the missing value att
#------------------------------------------------------------------------
varcolors  <- ncvar_def("colors", "", list(dimnchar, dimcolorno), 
			prec="char" )

ncid <- nc_create( "colornames.nc", list(varcolors) )

ncvar_put( ncid, "colors", cnames, verbose=TRUE )

nc_close( ncid )



