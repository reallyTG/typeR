library(bnstruct)


### Name: test.updated.bn
### Title: check if an updated 'BN' is present in an 'InferenceEngine'.
### Aliases: test.updated.bn test.updated.bn,InferenceEngine
###   test.updated.bn,InferenceEngine-method

### ** Examples

## Not run: 
##D dataset <- BNDataset("file.header", "file.data")
##D bn <- BN(dataset)
##D ie <- InferenceEngine(bn)
##D test.updated.bn(ie) # FALSE
##D 
##D observations(ie) <- list("observed.vars"=("A","G","X"), "observed.vals"=c(1,2,1))
##D ie <- belief.propagation(ie)
##D test.updated.bn(ie) # TRUE
## End(Not run)




