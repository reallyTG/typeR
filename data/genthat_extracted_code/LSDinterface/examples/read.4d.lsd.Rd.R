library(LSDinterface)


### Name: read.4d.lsd
### Title: Read all instances of LSD variables (time series) from multiple
###   LSD results file into a 4D array
### Aliases: read.4d.lsd
### Keywords: interface file datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# reads all instances of all variables from three files,
# pasting the directory where the example files are (not required if in working dir)
allArray <- read.4d.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                            paste0( path, "/", "Sim1_2.res" ),
                            paste0( path, "/", "Sim1_3.res" ) ) )

# See parts of the 4D array in the data viewer (require package 'utils')
## No test: 
View( allArray[ , , 1, 1 ] )   # first instance of first file (all vars and times)
View( allArray[ , 9, , 2 ] )   # all instances of ninth variable in second file (all t's)
View( allArray[ 50, 8, , ] )   # all instances of all files of 8th variable for t=50
## End(No test)

# the same, but pooling all files into a single one
allArrayPool <- read.4d.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                                paste0( path, "/", "Sim1_2.res" ),
                                paste0( path, "/", "Sim1_3.res" ) ),
                             pool = TRUE )
## No test: 
View( allArrayPool[ , , 1, 1 ] )   # first instance of first file (all vars and times)
View( allArrayPool[ , 9, , 1 ] )   # all instances of ninth variable in second file (all t's)
View( allArrayPool[ 50, 8, , ] )   # all instances of all files of 8th variable for t=50
## End(No test)

# read instances of a set of variables named '_A1p' and '_growth1'
abArray <- read.4d.lsd( c( paste0( path, "/", "Sim1_1.res.gz" ),
                           paste0( path, "/", "Sim1_2.res.gz" ),
                           paste0( path, "/", "Sim1_3.res.gz" ) ),
                        c( "_A1p", "_growth1" ) )
## No test: 
View( abArray[ , , 1, 2 ] )   # first instances of second file (all vars and times)
View( abArray[ , 2, , 3 ] )   # all instances of second variable in third file (all t's)
View( abArray[ 50, 1, , ] )   # all instances of all files of first variable for t=50
## End(No test)

# reads all variables/variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
allArray21_70 <- read.4d.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                                 paste0( path, "/", "Sim1_2.res" ) ),
                                 skip = 20, nrows = 50 )
## No test: 
View( allArray21_70[ , 9, , 2 ] )   # all instances of ninth variable in second file
View( allArray21_70[ 30, 8, , ] )   # all instances of all files of 8th variable for t=50
## End(No test)



