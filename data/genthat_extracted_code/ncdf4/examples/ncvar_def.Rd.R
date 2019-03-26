library(ncdf4)


### Name: ncvar_def
### Title: Define a netCDF Variable
### Aliases: ncvar_def
### Keywords: utilities

### ** Examples

# Define an integer dimension 
dimState <- ncdim_def( "StateNo", "count", 1:50 )

# Make an integer variable.  Note that an integer variable can have
# a double precision dimension, or vice versa; there is no fixed
# relationship between the precision of the dimension and that of the
# associated variable.  We just make an integer variable here for
# illustration purposes.
varPop <- ncvar_def("Pop", "count", dimState, -1, 
		longname="Population", prec="integer")

# Create a netCDF file with this variable
ncnew <- nc_create( "states_population.nc", varPop )

# Write some values to this variable on disk.
popAlabama <- 4447100
ncvar_put( ncnew, varPop, popAlabama, start=1, count=1 )

# Add source info metadata to file
ncatt_put( ncnew, 0, "source", "Census 2000 from census bureau web site")

nc_close(ncnew)

# Now illustrate some manipulations of the var.ncdf object
filename <- "states_population.nc"
nc <- nc_open(filename)
print(paste("File",nc$filename,"contains",nc$nvars,"variables"))
for( i in 1:nc$nvars ) {
	v <- nc$var[[i]]
	print(paste("Here is information on variable number",i))
	print(paste("   Name: ",v$name))
	print(paste("   Units:",v$units))
	print(paste("   Missing value:",v$missval))
	print(paste("   # dimensions :",v$ndims))
	print(paste("   Variable size:",v$varsize))
	}

# Illustrate creating variables of various types.  You will find
# that the type of the missing_value attribute automatically follows
# the type of the variable.
dimt <- ncdim_def( "Time", "days", 1:3 ) 
missval <- -1
varShort <- ncvar_def( "varShort", "meters", dimt, missval, prec="short")
varInt   <- ncvar_def( "varInt",   "meters", dimt, missval, prec="integer")
varFloat <- ncvar_def( "varFloat", "meters", dimt, missval, prec="single")
varDouble<- ncvar_def( "varDouble","meters", dimt, missval, prec="double")
nctypes <- nc_create("vartypes.nc", list(varShort,varInt,varFloat,varDouble) )
nc_close(nctypes)



