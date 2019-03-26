library(LSDinterface)


### Name: read.list.lsd
### Title: Read one or all instances of LSD variables (time series) from a
###   LSD results file into a list
### Aliases: read.list.lsd
### Keywords: interface file datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# reads all instances of all variables from three files (one matrix each),
# pasting the directory where the example files are (not required if in working dir)
tableList <- read.list.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                               paste0( path, "/", "Sim1_2.res" ),
                               paste0( path, "/", "Sim1_3.res" ) ) )

# See parts of the 3D array in the data viewer (require package 'utils')
## No test: 
View( tableList[[ 1 ]] )
View( tableList[[ 2 ]] )
View( tableList[[ 3 ]] )
## End(No test)

# read all instances of a set of variables named '_A1p' and '_growth1'
# and pool data
abTable <- read.list.lsd( c( paste0( path, "/", "Sim1_1.res.gz" ),
                             paste0( path, "/", "Sim1_2.res.gz" ) ),
                          c( "_A1p", "_growth1" ), pool = TRUE )
## No test: 
View( abTable )
## End(No test)

# reads instance 4 of all variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
inst4List21_70 <- read.list.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                                    paste0( path, "/", "Sim1_2.res" ) ),
                                 skip = 20, nrows = 50, instance = 4 )
## No test: 
View( inst4List21_70[[ 1 ]] )
View( inst4List21_70[[ 2 ]] )
## End(No test)



