library(backports)


### Name: import
### Title: Import backported functions into your package
### Aliases: import

### ** Examples

## Not run: 
##D # This imports all functions implemented in backports while the package is loaded
##D .onLoad <- function(libname, pkgname) {
##D   backports::import(pkgname)
##D }
##D 
##D # This only imports the function "trimws"
##D .onLoad <- function(libname, pkgname) {
##D   backports::import(pkgname, "trimws")
##D }
##D 
##D # This imports all backports from base and force-imports "hasName" from utils
##D .onLoad <- function(libname, pkgname) {
##D   backports::import(pkgname)
##D   backports::import(pkgname, "hasName", force = TRUE)
##D }
## End(Not run)



