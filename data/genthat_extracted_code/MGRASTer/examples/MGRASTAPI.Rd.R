library(MGRASTer)


### Name: MGRASTAPI
### Title: Local Representation of MG-RAST API
### Aliases: MGRASTAPI .MGRAST build.MGRAST load.MGRAST

### ** Examples

## Not run: 
##D ##  get API currently in use
##D API <- get ("API", .MGRAST)
##D 
##D ##  compare to API distributed with the package
##D identical (API, load.MGRAST())
##D 
##D ##  build and save a new (possibly updated) copy
##D build.MGRAST ("my_copy.rda")
##D 
##D ##  load it
##D API <- load.MGRAST ("my_copy.rda")
##D 
##D ##  put it into effect
##D assign ("API", API, .MGRAST)			
## End(Not run)


