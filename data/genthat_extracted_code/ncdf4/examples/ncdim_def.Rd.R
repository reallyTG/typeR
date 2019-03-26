library(ncdf4)


### Name: ncdim_def
### Title: Define a netCDF Dimension
### Aliases: ncdim_def
### Keywords: utilities

### ** Examples

# Define some straightforward dimensions
x <- ncdim_def( "Lon", "degreesE", 0.5:359.5)
y <- ncdim_def( "Lat", "degreesN", as.double(-89:89))
t <- ncdim_def( "Time", "days since 1900-01-01", 1:10, unlim=TRUE)

# Make a variable with those dimensions.  Note order: time is LAST
salinity <- ncvar_def("Salinity",    "ppt",  list(x,y,t), 1.e30 )

# Create a netCDF file with this variable
ncnew <- nc_create( "salinity.nc", salinity )

nc_close(ncnew)

# Now, illustrate some manipulations of the ncdim object.
filename <- "salinity.nc"
nc <- nc_open( filename )
print(paste("File",filename,"contains",nc$ndims,"dimensions"))
for( i in 1:nc$ndims ) {
	print(paste("Here is information about dimension number",i,":"))
	d <- nc$dim[[i]]
	print(paste("    Name  :",d$name))
	print(paste("    Units :",d$units))
	print(paste("    Length:",d$len))
	print("    Values:")
	print(d$vals)
	print(paste("    Unlimited:",d$unlim))
	}



