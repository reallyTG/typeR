library(bnstruct)


### Name: belief.propagation
### Title: perform belief propagation.
### Aliases: belief.propagation belief.propagation,InferenceEngine
###   belief.propagation,InferenceEngine-method

### ** Examples

## Not run: 
##D dataset <- BNDataset("file.header", "file.data")
##D bn <- BN(dataset)
##D ie <- InferenceEngine(bn)
##D ie <- belief.propagation(ie)
##D 
##D observations(ie) <- list("observed.vars"=("A","G","X"), "observed.vals"=c(1,2,1))
##D belief.propagation(ie)
## End(Not run)




