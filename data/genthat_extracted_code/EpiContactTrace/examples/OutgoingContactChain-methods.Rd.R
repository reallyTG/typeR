library(EpiContactTrace)


### Name: OutgoingContactChain
### Title: 'OutgoingContactChain'
### Aliases: OutgoingContactChain OutgoingContactChain,Contacts-method
###   OutgoingContactChain,ContactTrace-method
###   OutgoingContactChain,data.frame-method
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
##D ## Calculate outgoing contact chain from a ContactTrace object
##D oc.1 <- OutgoingContactChain(contactTrace)
##D 
##D ## Calculate outgoing contact chain using tEnd and days
##D oc.2 <- OutgoingContactChain(transfers,
##D                             root=2645,
##D                             tEnd='2005-10-31',
##D                             days=91)
##D 
##D ## Check that the result is identical
##D identical(oc.1, oc.2)
##D 
##D ## Calculate outgoing contact chain for all included herds
##D ## First extract all source and destination from the dataset
##D root <- sort(unique(c(transfers$source,
##D                       transfers$destination)))
##D 
##D ## Calculate outgoing contact chain
##D result <- OutgoingContactChain(transfers,
##D                                root=root,
##D                                tEnd='2005-10-31',
##D                                days=91)
## End(Not run)




