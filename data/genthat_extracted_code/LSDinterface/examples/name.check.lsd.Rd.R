library(LSDinterface)


### Name: name.check.lsd
### Title: Check a set of LSD variables names against a LSD results file
### Aliases: name.check.lsd
### Keywords: attribute misc

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

name.check.lsd( paste0( path, "/", "Sim1_1.res" ) )

name.check.lsd( paste0( path, "/", "Sim1_1.res" ),
                col.names = c( "GDP", "_growth1" ) )



