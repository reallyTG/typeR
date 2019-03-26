library(LSDinterface)


### Name: info.stats.lsd
### Title: Compute Monce Carlo statistics from a set of LSD runs
### Aliases: info.stats.lsd
### Keywords: attribute file

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# reads first instance of all variables from three MC files (3D array)
inst1Array <- read.3d.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                              paste0( path, "/", "Sim1_2.res" ),
                              paste0( path, "/", "Sim1_3.res" ) ) )

# creates statistics data frames for the variables
inst1Stats <- info.stats.lsd( inst1Array )

# See matrix in the data viewer (require package 'utils')
## No test: 
View( inst1Stats )
## End(No test)

# organize the stats by variable (dim=2) and file (dim=3)
inst1Stats2 <- info.stats.lsd( inst1Array, rows = 2, cols = 3 )
## No test: 
View( inst1Stats2 )
## End(No test)

# the same but for all instance of all variables (from a 4D array)
allArray <- read.4d.lsd( c( paste0( path, "/", "Sim1_1.res" ),
                            paste0( path, "/", "Sim1_2.res" ),
                            paste0( path, "/", "Sim1_3.res" ) ) )
allStats <- info.stats.lsd( allArray )
## No test: 
View( allStats )
## End(No test)

# organize the stats by file (dim=4) and variable (dim=2)
allStats2 <- info.stats.lsd( allArray, rows = 4, cols = 2 )
## No test: 
View( allStats2 )
## End(No test)



