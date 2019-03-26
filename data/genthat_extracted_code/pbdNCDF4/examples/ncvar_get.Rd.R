library(pbdNCDF4)


### Name: ncvar_get
### Title: Read data from a netCDF file
### Aliases: ncvar_get
### Keywords: utilities

### ** Examples

## Not run: 
##D # Start with the simplest example.  If the file only has one variable in it,
##D # you can read the data as easily as this:
##D #
##D nc <- nc_open("salinity.nc")
##D # NOTE how not specifying varid reads the "only" var in the file
##D data <- ncvar_get( nc )	
##D nc_close(nc)
##D 
##D # In this next example we read values from file "writevals.nc", which is created by
##D # the R code in the example section for function "ncvar_put".  We open the
##D # file with readunlim=FALSE for potentially faster access, and to illustrate
##D # (below) how to read in the unlimited dimension values.
##D #
##D nc <- nc_open( "writevals.nc", readunlim=FALSE )
##D 
##D print(paste("The file has",nc$nvars,"variables"))
##D 
##D # This illustrates how to read all the data from a variable
##D v1 <- nc$var[[1]]
##D data1 <- ncvar_get( nc, v1 )	# by default, reads ALL the data
##D print(paste("Data for var ",v1$name,":",sep=""))
##D print(data1)
##D 
##D # This shows how the shape of the read data is preserved
##D v2 <- nc$var[[2]]
##D data2 <- ncvar_get( nc, v2 )
##D print(paste("Var 2 has name",v2$name,"and is of shape",dim(data2),
##D 	". Here are the values:"))
##D print(data2)
##D 
##D # This illustrates how to read data one timestep at a time.  In this
##D # example we will elaborately show how to deal with a variable whose
##D # shape is completely unknown (i.e., how many dimensions, and what their
##D # sizes are).  We will also, for illustration of a common case, show how
##D # to read in the values of the time dimension at each timestep.
##D v3      <- nc$var[[3]]
##D varsize <- v3$varsize
##D ndims   <- v3$ndims
##D nt      <- varsize[ndims]  # Remember timelike dim is always the LAST dimension!
##D for( i in 1:nt ) {
##D 	# Initialize start and count to read one timestep of the variable.
##D 	start <- rep(1,ndims)	# begin with start=(1,1,1,...,1)
##D 	start[ndims] <- i	# change to start=(1,1,1,...,i) to read timestep i
##D 	count <- varsize	# begin w/count=(nx,ny,nz,...,nt), reads entire var
##D 	count[ndims] <- 1	# change to count=(nx,ny,nz,...,1) to read 1 tstep
##D 	data3 <- ncvar_get( nc, v3, start=start, count=count )
##D 
##D 	# Now read in the value of the timelike dimension
##D 	timeval <- ncvar_get( nc, v3$dim[[ndims]]$name, start=i, count=1 )
##D 
##D 	print(paste("Data for variable",v3$name,"at timestep",i,
##D 		" (time value=",timeval,v3$dim[[ndims]]$units,"):"))
##D 	print(data3)
##D 	}
##D 
##D nc_close(nc)
## End(Not run)



