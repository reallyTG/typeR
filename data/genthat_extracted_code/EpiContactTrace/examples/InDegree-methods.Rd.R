library(EpiContactTrace)


### Name: InDegree
### Title: 'InDegree'
### Aliases: InDegree InDegree,Contacts-method InDegree,ContactTrace-method
###   InDegree,data.frame-method
### Keywords: methods

### ** Examples

## Not run: 
##D 
##D ## Load data
##D data(transfers)
##D 
##D ## Perform contact tracing using tEnd and days
##D contactTrace <- Trace(movements=transfers,
##D                       root=2645,
##D                       tEnd='2005-10-31',
##D                       days=91)
##D 
##D ## Calculate indegree from a ContactTrace object
##D id.1 <- InDegree(contactTrace)
##D 
##D ## Calculate indegree using tEnd and days
##D id.2 <- InDegree(transfers,
##D                  root=2645,
##D                  tEnd='2005-10-31',
##D                  days=91)
##D 
##D ## Check that the result is identical
##D identical(id.1, id.2)
##D 
##D ## Calculate indegree for all included herds
##D ## First extract all source and destination from the dataset
##D root <- sort(unique(c(transfers$source,
##D                       transfers$destination)))
##D 
##D ## Calculate indegree
##D result <- InDegree(transfers,
##D                    root=root,
##D                    tEnd='2005-10-31',
##D                    days=91)
## End(Not run)



