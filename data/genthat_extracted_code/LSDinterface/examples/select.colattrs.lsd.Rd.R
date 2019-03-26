library(LSDinterface)


### Name: select.colattrs.lsd
### Title: Select a subset of a LSD results matrix (by variable attributes)
### Aliases: select.colattrs.lsd
### Keywords: datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# reads all instances of all variables
bigTable <- read.raw.lsd( paste0( path, "/", "Sim1_1.res" ) )

# build the info table
info <- info.details.lsd( paste0( path, "/", "Sim1_1.res" ) )

# read some instances of a set of variables named '_A1p' and '_growth1'
abFirst2 <- select.colattrs.lsd( bigTable, info, c( "_A1p", "_growth1" ),
                                 posit = c( "1_2", "1_5" ) )

# See matrix in the data viewer (require package 'utils')
## No test: 
View( abFirst2 )
## End(No test)

# reads instances of variable '_A1p' that start at time step t = 1
a50 <- select.colattrs.lsd( bigTable, info, make.names( "_A1p" ), init.time = 1 )
## No test: 
View( a50 )
## End(No test)



