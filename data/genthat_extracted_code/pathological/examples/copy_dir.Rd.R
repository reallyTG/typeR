library(pathological)


### Name: copy_dir
### Title: Copy the contents of a directory
### Aliases: copy_dir dir_copy

### ** Examples

## Not run: 
##D #Copy subdirs by default
##D copy_dir(R.home("etc"), file.path(tempdir(), "etc"))
##D #Just copy the top level
##D copy_dir(R.home("etc"), file.path(tempdir(), "etc2"), recursive = FALSE)
##D #Now copy deeper levels, without overwriting.
##D copy_dir(R.home("etc"), file.path(tempdir(), "etc2"), overwrite = FALSE)
##D #Cleanup
##D unlink(file.path(tempdir(), "etc"), recursive = TRUE)
##D unlink(file.path(tempdir(), "etc2"), recursive = TRUE)
## End(Not run)



