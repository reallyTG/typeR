library(LSDinterface)


### Name: read.3d.lsd
### Title: Read one instance of LSD variables (time series) from multiple
###   LSD results files into a 3D array
### Aliases: read.3d.lsd
### Keywords: interface file datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# reads first instance of all variables from three files (one level each),
# pasting the directory where the example files are (not required if in working dir)
inst1Array <- read.3d.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                              paste0( path, "/", "Sim1_2.res" ),
                              paste0( path, "/", "Sim1_3.res" ) ) )

# See parts of the 3D array in the data viewer (require package 'utils')
## No test: 
View( inst1Array[ , , 1 ] )
View( inst1Array[ , , 2 ] )
View( inst1Array[ , , 3 ] )
## End(No test)

# read first instance of a set of variables named '_A1p' and '_growth1'
ab1Array <- read.3d.lsd( c( paste0( path, "/", "Sim1_1.res.gz" ),
                            paste0( path, "/", "Sim1_2.res.gz" ),
                            paste0( path, "/", "Sim1_3.res.gz" ) ),
                         c( "_A1p", "_growth1" ) )
## No test: 
View( ab1Array[ , , 1 ] )
View( ab1Array[ , , 2 ] )
View( ab1Array[ , , 3 ] )
## End(No test)

# reads instance 2 of all variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
inst2Array21_70 <- read.3d.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                                   paste0( path, "/", "Sim1_2.res" ) ),
                                skip = 20, nrows = 50, instance = 2 )
## No test: 
View( inst2Array21_70[ , , 1 ] )
View( inst2Array21_70[ , , 2 ] )
## End(No test)



