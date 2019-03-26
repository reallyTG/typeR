library(adfExplorer)


### Name: dir.create.adf
### Title: Create a directory on an amigaDisk object
### Aliases: dir.create.adf
###   dir.create.adf,amigaDisk,character,missing,missing-method
###   dir.create.adf
###   dir.create.adf,amigaDisk,character,POSIXt,missing-method
###   dir.create.adf
###   dir.create.adf,amigaDisk,character,POSIXt,character-method

### ** Examples

## Not run: 
##D ## create a blank DOS disk:
##D blank.disk <- blank.amigaDOSDisk("blank", "DD", "FFS", TRUE, FALSE, FALSE)
##D 
##D ## creating a new directory on the blank disk is easy:
##D blank.disk <- dir.create.adf(blank.disk, "new_dir")
##D 
##D ## in the line above, the directory is placed in the
##D ## current directory (the root in this case). Directories
##D ## can also be created by specifying the full path:
##D 
##D blank.disk <- dir.create.adf(blank.disk, "DF0:new_dir/sub_dir")
##D 
##D ## check whether we succeeded:
##D list.adf.files(blank.disk)
##D 
##D ## we can even make it the current dir:
##D current.adf.dir(blank.disk) <- "DF0:new_dir/sub_dir"
## End(Not run)



