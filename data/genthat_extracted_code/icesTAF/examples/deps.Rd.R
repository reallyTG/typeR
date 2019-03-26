library(icesTAF)


### Name: deps
### Title: List Dependencies
### Aliases: deps

### ** Examples

## Not run: 
##D dir <- system.file(package="MASS", "scripts")
##D script <- system.file(package="MASS", "scripts/ch08.R")
##D 
##D deps(script)                   # dependencies
##D deps(script, base=TRUE)        # including base packages
##D deps(script, installed=FALSE)  # not (yet) installed
##D 
##D deps(dir)
##D deps(dir, list=TRUE)
##D 
##D deps(dir, available=FALSE)  # dependencies that might be unavailable
## End(Not run)




