library(bnstruct)


### Name: InferenceEngine-class
### Title: InferenceEngine class.
### Aliases: InferenceEngine InferenceEngine,InferenceEngine-class
###   InferenceEngine-class initialize,InferenceEngine-method

### ** Examples

## Not run: 
##D dataset <- BNDataset()
##D dataset <- read.dataset(dataset, "file.header", "file.data")
##D bn <- BN(dataset)
##D eng <- InferenceEngine(bn)
##D 
##D obs <- list(c("A","G,"X),c(1,2,1))
##D eng.2 <- InferenceEngine(bn, obs)
## End(Not run)




