library(devtools)


### Name: reload
### Title: Unload and reload package.
### Aliases: reload

### ** Examples

## Not run: 
##D # Reload package that is in current directory
##D reload(".")
##D 
##D # Reload package that is in ./ggplot2/
##D reload("ggplot2/")
##D 
##D # Can use inst() to find the package path
##D # This will reload the installed ggplot2 package
##D reload(pkgload::inst("ggplot2"))
## End(Not run)



