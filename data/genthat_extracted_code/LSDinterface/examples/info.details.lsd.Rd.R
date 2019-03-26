library(LSDinterface)


### Name: info.details.lsd
### Title: Get detailed information from a LSD results file
### Aliases: info.details.lsd
### Keywords: attribute file

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

info1 <- info.details.lsd( paste0( path, "/", "Sim1_1.res" ) )
## No test: 
View( info1 )
## End(No test)

info2 <- info.details.lsd( paste0( path, "/", "Sim1_2.res.gz" ) )
## No test: 
View( info2 )
## End(No test)



