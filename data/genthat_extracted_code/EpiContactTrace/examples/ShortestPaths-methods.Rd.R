library(EpiContactTrace)


### Name: ShortestPaths
### Title: 'ShortestPaths'
### Aliases: ShortestPaths ShortestPaths,ContactTrace-method
###   ShortestPaths,data.frame-method
### Keywords: methods

### ** Examples

## Not run: 
##D 
##D ## Load data
##D data(transfers)
##D 
##D ## Perform contact tracing
##D contactTrace <- Trace(movements=transfers,
##D                       root=2645,
##D                       tEnd='2005-10-31',
##D                       days=90)
##D 
##D ShortestPaths(contactTrace)
##D 
##D ## Calculate shortest paths for all included herds
##D ## First extract all source and destination from the dataset
##D root <- sort(unique(c(transfers$source, transfers$destination)))
##D 
##D sp <- ShortestPaths(transfers, root=root, tEnd='2005-10-31', days=90)
##D 
## End(Not run)



