library(LSDinterface)


### Name: info.init.lsd
### Title: Read initial conditions from a LSD results file
### Aliases: info.init.lsd
### Keywords: attribute file

### ** Examples

# Get the examples directory
path <- system.file( "extdata", package = "LSDinterface" )

init1 <- info.init.lsd( paste0( path, "/", "Sim1_1.res" ) )
## No test: 
View( init1 )
## End(No test)

init2 <- info.init.lsd( paste0( path, "/", "Sim1_2.res.gz" ) )
## No test: 
View( init2 )
## End(No test)



