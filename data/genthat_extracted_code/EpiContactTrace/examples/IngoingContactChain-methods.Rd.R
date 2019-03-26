library(EpiContactTrace)


### Name: IngoingContactChain
### Title: 'IngoingContactChain'
### Aliases: IngoingContactChain IngoingContactChain,Contacts-method
###   IngoingContactChain,ContactTrace-method
###   IngoingContactChain,data.frame-method
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
##D ## Calculate ingoing contact chain from a ContactTrace object
##D ic.1 <- IngoingContactChain(contactTrace)
##D 
##D ## Calculate ingoing contact chain using tEnd and days
##D ic.2 <- IngoingContactChain(transfers,
##D                             root=2645,
##D                             tEnd='2005-10-31',
##D                             days=91)
##D 
##D ## Check that the result is identical
##D identical(ic.1, ic.2)
##D 
##D ## Calculate ingoing contact chain for all included herds
##D ## First extract all source and destination from the dataset
##D root <- sort(unique(c(transfers$source,
##D                       transfers$destination)))
##D 
##D ## Calculate ingoing contact chain
##D result <- IngoingContactChain(transfers,
##D                               root=root,
##D                               tEnd='2005-10-31',
##D                               days=91)
## End(Not run)



