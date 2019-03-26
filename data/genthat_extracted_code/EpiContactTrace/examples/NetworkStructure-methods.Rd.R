library(EpiContactTrace)


### Name: NetworkStructure
### Title: 'NetworkStructure'
### Aliases: NetworkStructure NetworkStructure,Contacts-method
###   NetworkStructure,ContactTrace-method
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
##D NetworkStructure(contactTrace)
## End(Not run)



