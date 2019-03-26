library(lxb)


### Name: lxb-package
### Title: Fast LXB file reader
### Aliases: lxb-package lxb
### Keywords: package

### ** Examples

## Not run: 
##D ## Typically your LXB files should be organized with one folder per
##D ## plate, with each plate consisting of multiple wells and each well
##D ## corresponding to one LXB file.  Assuming the folder 'plate1' contains
##D ## all LXB files for the first plate, here is how to read all parameter
##D ## data for plate 1 into a list of matrices (each list item is one well,
##D ## each column in a matrix corresponds to one parameter):
##D y <- readLxb('plate1/*.lxb')
##D 
##D ## It is now possible inspect individual wells, e.g. the dimensions of
##D ## the first well are given by:
##D dim(y[[1]])
##D 
##D ## .. and the names of the parameters for well 1 are given by:
##D colnames(y[[1]])
##D 
##D ## If the LXB files have names like "XXXX_B1.lxb" (where 'B1' indicates
##D ## that the LXB file corresponds to the first well on the second row),
##D ## then it is also possible to index 'y' by the well name, e.g.:
##D dim(y$B1)
##D 
##D ## .. which is the same as:
##D dim(y[[2]])
##D 
##D ## You can see all well names (and the order of the wells in 'y') by
##D ## typing:
##D names(y)
## End(Not run)



