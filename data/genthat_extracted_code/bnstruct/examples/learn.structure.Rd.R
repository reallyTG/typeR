library(bnstruct)


### Name: learn.structure
### Title: learn the structure of a network.
### Aliases: learn.structure learn.structure,BN,BNDataset
###   learn.structure,BN,BNDataset-method

### ** Examples

## Not run: 
##D dataset <- BNDataset("file.header", "file.data")
##D bn <- BN(dataset)
##D # use MMHC
##D bn <- learn.structure(bn, dataset, alpha=0.05, ess=1, bootstrap=FALSE)
##D 
##D # now use Silander-Myllymaki
##D layers <- layering(bn)
##D mfl <- as.matrix(read.table(header=F,
##D text='0 1 1 1 1 0 1 1 1 1 0 0 8 7 7 0 0 0 14 6 0 0 0 0 19'))
##D bn <- learn.structure(bn, dataset, algo='sm', max.fanin=3, cont.nodes=c(),
##D                       layering=layers, max.fanin.layers=mfl, use.imputed.data=FALSE)
## End(Not run)




