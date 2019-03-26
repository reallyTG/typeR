library(EpiContactTrace)


### Name: OutDegree
### Title: 'OutDegree'
### Aliases: OutDegree OutDegree,Contacts-method
###   OutDegree,ContactTrace-method OutDegree,data.frame-method
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
##D ## Calculate outdegree from a ContactTrace object
##D od.1 <- OutDegree(contactTrace)
##D 
##D ## Calculate outdegree using tEnd and days
##D od.2 <- OutDegree(transfers,
##D                   root=2645,
##D                   tEnd='2005-10-31',
##D                   days=91)
##D 
##D ## Check that the result is identical
##D identical(od.1, od.2)
##D 
##D ## Calculate outdegree for all included herds
##D ## First extract all source and destination from the dataset
##D root <- sort(unique(c(transfers$source,
##D                       transfers$destination)))
##D 
##D ## Calculate outdegree
##D result <- OutDegree(transfers,
##D                     root=root,
##D                     tEnd='2005-10-31',
##D                     days=91)
## End(Not run)



