library(pkgmaker)


### Name: add_lib
### Title: Adding Package Libraries
### Aliases: add_lib

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)

ol <- .libPaths()
# called sequentially, .libPaths only add the last library
show( .libPaths('.') )
show( .libPaths(tempdir()) )
# restore
.libPaths(ol)

# .libPaths does not keep the standard user library
show( .libPaths() ) 
show( .libPaths('.') )
# restore
.libPaths(ol)

# with add_lib
show( add_lib('.') )
show( add_lib(tempdir()) )
show( add_lib('..', append=TRUE) )

# restore 
.libPaths(ol)




