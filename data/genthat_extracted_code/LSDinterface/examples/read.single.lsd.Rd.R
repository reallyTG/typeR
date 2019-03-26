library(LSDinterface)


### Name: read.single.lsd
### Title: Read LSD variables (time series) from a LSD results file (a
###   single instance of each variable only)
### Aliases: read.single.lsd
### Keywords: interface file datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# Load a sample .res file into a simple matrix (first instances only)
macroVar <- read.single.lsd( paste0( path, "/", "Sim1_1.res" ) )

# See matrix in the data viewer (require package 'utils')
## No test: 
View( macroVar )
## End(No test)

# read second instance of a set of variables named '_A1p' and '_growth1'
ag2Table <- read.single.lsd( paste0( path, "/", "Sim1_2.res" ),
                             c( "_A1p", "_growth1" ), instance = 2 )
## No test: 
View( ag2Table )
## End(No test)

# reads first instance of all variables, skipping the initial 20 time steps
# and keeping up to 50 time steps (from t = 21 up to t = 70)
var21_70 <- read.single.lsd( paste0( path, "/", "Sim1_1.res" ),
                             skip = 20, nrows = 50 )
## No test: 
View( var21_70 )
## End(No test)



