library(pbdNCDF4)


### Name: ncvar_put
### Title: Write data to a netCDF file
### Aliases: ncvar_put
### Keywords: utilities

### ** Examples

## Not run: 
##D #--------------------------------
##D # Make a few dimensions we can use
##D #--------------------------------
##D nx <- 3
##D ny <- 4
##D nt <- 5
##D xvals <- (1:nx)*100.
##D dimX <- ncdim_def( "X", "meters", xvals )
##D dimY <- ncdim_def( "Y", "meters", (1:ny)*100. )
##D dimT <- ncdim_def( "Time", "seconds", (1:nt)/100., unlim=TRUE )
##D 
##D #-------------------------------------------------------------------
##D # Make varables of various dimensionality, for illustration purposes
##D #-------------------------------------------------------------------
##D mv <- 1.e30		# missing value to use
##D var1d <- ncvar_def( "var1d", "units", dimX, mv )
##D var2d <- ncvar_def( "var2d", "units", list(dimX,dimY), mv )
##D var3d <- ncvar_def( "var3d", "units", list(dimX,dimY,dimT), mv )
##D 
##D #---------------------
##D # Create the test file
##D #---------------------
##D nc <- nc_create( "writevals.nc", list(var1d,var2d,var3d) )
##D 
##D #----------------------------
##D # Write some data to the file
##D #----------------------------
##D data1d <- runif(nx)
##D ncvar_put( nc, var1d, data1d )	# no start or count: write all values
##D ncvar_put( nc, var1d, 27.5, start=3, count=1 ) # Write a value to the third slot
##D 
##D data2d <- runif(nx*ny)
##D ncvar_put( nc, var2d, data2d )	# no start or count: write all values
##D 
##D #--------------------------------
##D # Write a 1-d slice to the 2d var
##D #--------------------------------
##D ncvar_put( nc, var2d, data1d, start=c(1,2), count=c(nx,1) )	
##D 
##D #--------------------------------------------------------------
##D # Note how "-1" in the count means "the whole dimension length", 
##D # which equals nx in this case
##D #--------------------------------------------------------------
##D ncvar_put( nc, var2d, data1d, start=c(1,3), count=c(-1,1) )	
##D 
##D #-------------------------------------------------------------------------------
##D # The 3-d variable has an unlimited dimension.  We will loop over the timesteps,
##D # writing one 2-d slice per timestep.
##D #-------------------------------------------------------------------------------
##D for( i in 1:nt) 
##D 	ncvar_put( nc, var3d, data2d, start=c(1,1,i), count=c(-1,-1,1) )
##D 
##D nc_close(nc)
##D 
##D #----------------------------------------------------------------------
##D # Illustrate creating a character type variable
##D #----------------------------------------------------------------------
##D cnames   <- c("red", "orange", "green", "yellow", "puce", "colorwithverylongname" )
##D nstrings <- length(cnames)
##D 
##D #--------------------------------------------------------------
##D # Make dimensions. Setting "dimnchar" to have a length of 12
##D # means that the maximum color name
##D # length can be 12.  Longer names will be truncated to this.
##D # We don't need dimvars for this example.
##D #--------------------------------------------------------------
##D dimnchar   <- ncdim_def("nchar",   "", 1:12, create_dimvar=FALSE )
##D dimcolorno <- ncdim_def("colorno", "", 1:nstrings, create_dimvar=FALSE )
##D 
##D #------------------------------------------------------------------------
##D # NOTE in the following call that units is set to the empty string (""),
##D # which suppresses creation of a units attribute, and the missing value
##D # is entirely omitted, which suppresses creation of the missing value att
##D #------------------------------------------------------------------------
##D varcolors  <- ncvar_def("colors", "", list(dimnchar, dimcolorno), 
##D 			prec="char" )
##D 
##D ncid <- nc_create( "colornames.nc", list(varcolors) )
##D 
##D ncvar_put( ncid, "colors", cnames, verbose=TRUE )
##D 
##D nc_close( ncid )
## End(Not run)



