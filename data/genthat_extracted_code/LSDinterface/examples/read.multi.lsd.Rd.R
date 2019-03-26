library(LSDinterface)


### Name: read.multi.lsd
### Title: Read all instances of LSD variables (time series) from a LSD
###   results file
### Aliases: read.multi.lsd
### Keywords: interface file datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# Load a sample .res file into a simple matrix (all instances),
# pasting the directory where the example files are (not required if in working dir)
macroList <- read.multi.lsd( paste0( path, "/", "Sim1_1.res" ) )

# See matrix in the data viewer (require package 'utils')
length( macroList )
## No test: 
View( macroList[[ 1 ]] )
View( macroList[[ 8 ]] )
## End(No test)

# reads first instance of 2 variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
varsList21_70 <- read.multi.lsd( paste0( path, "/", "Sim1_1.res" ),
                                 c( "_A1p", "_growth1" ),
                                 skip = 20, nrows = 50 )
## No test: 
View( varsList21_70[[ 1 ]] )
View( varsList21_70[[ 2 ]] )
## End(No test)



