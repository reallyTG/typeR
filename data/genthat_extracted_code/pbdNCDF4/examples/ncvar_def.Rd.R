library(pbdNCDF4)


### Name: ncvar_def
### Title: Define a netCDF Variable
### Aliases: ncvar_def
### Keywords: utilities

### ** Examples

## Not run: 
##D # Define an integer dimension 
##D dimState <- ncdim_def( "StateNo", "count", 1:50 )
##D 
##D # Make an integer variable.  Note that an integer variable can have
##D # a double precision dimension, or vice versa; there is no fixed
##D # relationship between the precision of the dimension and that of the
##D # associated variable.  We just make an integer variable here for
##D # illustration purposes.
##D varPop <- ncvar_def("Pop", "count", dimState, -1, 
##D 		longname="Population", prec="integer")
##D 
##D # Create a netCDF file with this variable
##D ncnew <- nc_create( "states_population.nc", varPop )
##D 
##D # Write some values to this variable on disk.
##D popAlabama <- 4447100
##D ncvar_put( ncnew, varPop, popAlabama, start=1, count=1 )
##D 
##D # Add source info metadata to file
##D ncatt_put( ncnew, 0, "source", "Census 2000 from census bureau web site")
##D 
##D nc_close(ncnew)
##D 
##D # Now illustrate some manipulations of the var.ncdf object
##D filename <- "states_population.nc"
##D nc <- nc_open(filename)
##D print(paste("File",nc$filename,"contains",nc$nvars,"variables"))
##D for( i in 1:nc$nvars ) {
##D 	v <- nc$var[[i]]
##D 	print(paste("Here is information on variable number",i))
##D 	print(paste("   Name: ",v$name))
##D 	print(paste("   Units:",v$units))
##D 	print(paste("   Missing value:",v$missval))
##D 	print(paste("   # dimensions :",v$ndims))
##D 	print(paste("   Variable size:",v$varsize))
##D 	}
##D 
##D # Illustrate creating variables of various types.  You will find
##D # that the type of the missing_value attribute automatically follows
##D # the type of the variable.
##D dimt <- ncdim_def( "Time", "days", 1:3 ) 
##D missval <- -1
##D varShort <- ncvar_def( "varShort", "meters", dimt, missval, prec="short")
##D varInt   <- ncvar_def( "varInt",   "meters", dimt, missval, prec="integer")
##D varFloat <- ncvar_def( "varFloat", "meters", dimt, missval, prec="single")
##D varDouble<- ncvar_def( "varDouble","meters", dimt, missval, prec="double")
##D nctypes <- nc_create("vartypes.nc", list(varShort,varInt,varFloat,varDouble) )
##D nc_close(nctypes)
## End(Not run)



