library(bnstruct)


### Name: learn.network
### Title: learn a network (structure and parameters) of a BN from a
###   BNDataset.
### Aliases: learn.network learn.network,BN learn.network,BN-method
###   learn.network,BNDataset learn.network,BNDataset-method

### ** Examples

## Not run: 
##D mydataset <- BNDataset("data.file", "header.file")
##D 
##D # starting from a BN
##D net <- BN(mydataset)
##D net <- learn.network(net, mydataset)
##D 
##D # start directly from the dataset
##D net <- learn.network(mydataset)
## End(Not run)




