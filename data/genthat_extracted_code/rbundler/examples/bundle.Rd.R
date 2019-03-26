library(rbundler)


### Name: bundle
### Title: Bundles a package and it's dependencies into a library.
### Aliases: bundle

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



