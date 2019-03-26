library(bnstruct)


### Name: BNDataset-class
### Title: BNDataset class.
### Aliases: BNDataset BNDataset,BNDataset-class BNDataset-class
###   initialize,BNDataset-method

### ** Examples

## Not run: 
##D # create from files
##D dataset <- BNDataset("file.data", "file.header")
##D 
##D # other way: create from raw dataset and metadata
##D data <- matrix(c(1:16), nrow = 4, ncol = 4)
##D dataset <- BNDataset(data = data,
##D                      discreteness = rep('d',4),
##D                      variables = c("a", "b", "c", "d"),
##D                      node.sizes = c(4,8,12,16))
## End(Not run)




