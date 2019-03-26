library(LSDinterface)


### Name: info.dimensions.lsd
### Title: Dimension information for a LSD results file
### Aliases: info.dimensions.lsd
### Keywords: attribute file

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

info.dimensions.lsd( paste0( path, "/", "Sim1_1.res" ) )
info.dimensions.lsd( paste0( path, "/", "Sim1_2.res.gz" ) )



