library(bnstruct)


### Name: learn.params
### Title: learn the parameters of a BN.
### Aliases: learn.params learn.params,BN,BNDataset
###   learn.params,BN,BNDataset-method

### ** Examples

## Not run: 
##D ## first create a BN and learn its structure from a dataset
##D dataset <- BNDataset("file.header", "file.data")
##D bn <- BN(dataset)
##D bn <- learn.structure(bn, dataset)
##D bn <- learn.params(bn, dataset, ess=1)
## End(Not run)




