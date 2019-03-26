library(xpose4)


### Name: xpose.data
### Title: Create an Xpose data object
### Aliases: xpose.data
### Keywords: methods

### ** Examples

# Here we create files from an example NONMEM run
 
od = setwd(tempdir()) # move to a temp directory
(cur.files <- dir()) # current files in temp directory

simprazExample(overwrite=TRUE) # write files
(new.files <- dir()[!(dir() %in% cur.files)])  # what files are new here?

xpdb <- xpose.data(1)


file.remove(new.files) # remove these files
setwd(od)  # restore working directory


## Not run: 
##D 
##D # We expect to find the required NONMEM run and table files for run
##D # 5 in the current working directory, and that the table files have
##D # a suffix of '.dat', e.g. sdtab5.dat
##D xpdb5 <- xpose.data(5, tab.suffix = ".dat") 
## End(Not run)




