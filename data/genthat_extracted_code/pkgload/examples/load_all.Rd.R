library(pkgload)


### Name: load_all
### Title: Load complete package.
### Aliases: load_all
### Keywords: programming

### ** Examples

## Not run: 
##D # Load the package in the current directory
##D load_all("./")
##D 
##D # Running again loads changed files
##D load_all("./")
##D 
##D # With reset=TRUE, unload and reload the package for a clean start
##D load_all("./", TRUE)
##D 
##D # With export_all=FALSE, only objects listed as exports in NAMESPACE
##D # are exported
##D load_all("./", export_all = FALSE)
## End(Not run)



