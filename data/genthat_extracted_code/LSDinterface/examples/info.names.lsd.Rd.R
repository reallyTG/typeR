library(LSDinterface)


### Name: info.names.lsd
### Title: Read unique variable names from a LSD results file (no
###   duplicates)
### Aliases: info.names.lsd
### Keywords: attribute file

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

info.names.lsd( paste0( path, "/", "Sim1_1.res" ) )

info.names.lsd( paste0( path, "/", "Sim1_2.res.gz" ) )



