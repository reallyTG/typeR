library(rbundler)


### Name: rbundler
### Title: A package dependency management utility.
### Aliases: rbundler rbundler-package

### ** Examples

## Not run: 
##D # Run bundle in the current path:
##D bundle()
##D # Check for the new `.Rbundle` entry in `.libPaths`:
##D .libPaths()
##D 
##D lib <- file.path(tempdir(), 'my_bundle_lib')
##D # Run bundle in the current path, overriding the target library:
##D bundle('.', lib)
##D # Check for the new entry in `.libPaths`:
##D .libPaths()
## End(Not run)



