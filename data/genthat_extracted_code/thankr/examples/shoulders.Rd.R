library(thankr)


### Name: shoulders
### Title: Find Out Who Maintains the Packages you Use
### Aliases: shoulders

### ** Examples

## Not run: 
##D # identifies the packages currently loaded in your session
##D shoulders() # equal to shoulders("session")
##D 
##D # shows all maintainers of your package library
##D shoulders("library")
##D 
##D # find out about a specific package
##D # by default it lists all dependencies of that package as well
##D shoulders("package", "utils", include_dependencies = FALSE)
##D shoulders("package", "utils")
## End(Not run)



