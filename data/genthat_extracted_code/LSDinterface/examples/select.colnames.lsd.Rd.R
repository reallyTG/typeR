library(LSDinterface)


### Name: select.colnames.lsd
### Title: Select a subset of a LSD results matrix (by column/variable
###   names)
### Aliases: select.colnames.lsd
### Keywords: datasets database

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

# reads all instances of all variables
bigTable <- read.raw.lsd( paste0( path, "/", "Sim1_1.res" ) )

# See matrix in the data viewer (require package 'utils')
## No test: 
View( bigTable )
## End(No test)

# extract all instances of a set of variables named '_A1p' and '_growth1'
abTable <- select.colnames.lsd( bigTable, make.names( c( "_A1p", "_growth1" ) ) )
## No test: 
View( abTable )
## End(No test)



