library(pkgmaker)


### Name: onLoad
### Title: Default Load/Unload Functions
### Aliases: onLoad onUnload

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


# in a package namespace:
.onLoad <- function(libname=NULL, pkgname){

	pkgmaker::onLoad(libname, pkgname)

}

# in a package namespace:
.onUnload <- function(libpath){

	pkgmaker::onUnload(libpath)

}



