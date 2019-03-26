library(R.filesets)


### Name: dsApplyInPairs.GenericDataFileSet
### Title: Applies a function to each pair of file in two file sets
### Aliases: dsApplyInPairs.GenericDataFileSet
###   GenericDataFileSet.dsApplyInPairs
###   dsApplyInPairs,GenericDataFileSet-method GenericDataFileSet.dsApply
###   dsApply.GenericDataFileSet dsApply,GenericDataFileSet-method
###   dsApplyInPairs
### Keywords: internal methods

### ** Examples
## Not run: 
##D  isPackageInstalled <- R.utils::isPackageInstalled
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - -
##D # Setting up a file set
##D # - - - - - - - - - - - - - - - - - - - - - - - -
##D path <- system.file(package="R.filesets")
##D ds <- GenericDataFileSet$byPath(path)
##D 
##D 
##D # - - - - - - - - - - - - - - - - - - - - - - - -
##D # Get the size of each file
##D # - - - - - - - - - - - - - - - - - - - - - - - -
##D # Alt 1.
##D res1 <- lapply(ds, FUN=getFileSize)
##D print(res1)
##D 
##D # Alt 2. (according to current settings; see package startup message)
##D res2 <- dsApply(ds, FUN=getFileSize)
##D print(res2)
##D stopifnot(identical(res2, res1))
##D 
##D # Alt 3. (via an internal loop)
##D res2 <- dsApply(ds, FUN=getFileSize, .parallel="none")
##D print(res2)
##D stopifnot(identical(res2, res1))
##D 
## End(Not run)


