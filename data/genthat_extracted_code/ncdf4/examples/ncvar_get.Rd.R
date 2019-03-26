library(ncdf4)


### Name: ncvar_get
### Title: Read data from a netCDF file
### Aliases: ncvar_get
### Keywords: utilities

### ** Examples

# Start with the simplest example.  If the file only has one variable in it,
# you can read the data as easily as this:
#
nc <- nc_open("salinity.nc")
# NOTE how not specifying varid reads the "only" var in the file
data <- ncvar_get( nc )	
nc_close(nc)

# In this next example we read values from file "writevals.nc", which is created by
# the R code in the example section for function "ncvar_put".  We open the
# file with readunlim=FALSE for potentially faster access, and to illustrate
# (below) how to read in the unlimited dimension values.
#
nc <- nc_open( "writevals.nc", readunlim=FALSE )

print(paste("The file has",nc$nvars,"variables"))

# This illustrates how to read all the data from a variable
v1 <- nc$var[[1]]
data1 <- ncvar_get( nc, v1 )	# by default, reads ALL the data
print(paste("Data for var ",v1$name,":",sep=""))
print(data1)

# This shows how the shape of the read data is preserved
v2 <- nc$var[[2]]
data2 <- ncvar_get( nc, v2 )
print(paste("Var 2 has name",v2$name,"and is of shape",dim(data2),
	". Here are the values:"))
print(data2)

# This illustrates how to read data one timestep at a time.  In this
# example we will elaborately show how to deal with a variable whose
# shape is completely unknown (i.e., how many dimensions, and what their
# sizes are).  We will also, for illustration of a common case, show how
# to read in the values of the time dimension at each timestep.
v3      <- nc$var[[3]]
varsize <- v3$varsize
ndims   <- v3$ndims
nt      <- varsize[ndims]  # Remember timelike dim is always the LAST dimension!
for( i in 1:nt ) {
	# Initialize start and count to read one timestep of the variable.
	start <- rep(1,ndims)	# begin with start=(1,1,1,...,1)
	start[ndims] <- i	# change to start=(1,1,1,...,i) to read timestep i
	count <- varsize	# begin w/count=(nx,ny,nz,...,nt), reads entire var
	count[ndims] <- 1	# change to count=(nx,ny,nz,...,1) to read 1 tstep
	data3 <- ncvar_get( nc, v3, start=start, count=count )

	# Now read in the value of the timelike dimension
	timeval <- ncvar_get( nc, v3$dim[[ndims]]$name, start=i, count=1 )

	print(paste("Data for variable",v3$name,"at timestep",i,
		" (time value=",timeval,v3$dim[[ndims]]$units,"):"))
	print(data3)
	}

nc_close(nc)



