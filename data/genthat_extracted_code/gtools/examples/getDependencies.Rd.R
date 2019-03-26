library(gtools)


### Name: getDependencies
### Title: Get package dependencies
### Aliases: getDependencies
### Keywords: utilities

### ** Examples

## A locally installed package
getDependencies("MASS", installed=TRUE, available=FALSE)

## Not run: 
##D ## A package on CRAN
##D getDependencies("gregmisc", installed=FALSE, available=TRUE)
## End(Not run)

## Show base and recommended dependencies
getDependencies("MASS", available=FALSE, base=TRUE, recommended=TRUE)

## Not run: 
##D ## Download the set of packages necessary to support a local package
##D deps <- getDependencies("MyLocalPackage", available=FALSE)
##D download.packages(deps, destdir="./R_Packages")
## End(Not run)




