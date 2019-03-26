library(EpiContactTrace)


### Name: Trace
### Title: Trace Contacts.
### Aliases: Trace

### ** Examples

## Not run: 
##D 
##D ## Load data
##D data(transfers)
##D 
##D ## Perform contact tracing using tEnd and days
##D trace.1 <- Trace(movements=transfers,
##D                  root=2645,
##D                  tEnd='2005-10-31',
##D                  days=91)
##D 
##D ## Perform contact tracing using inBegin, inEnd
##D ## outBegin and outEnd
##D trace.2 <- Trace(movements=transfers,
##D                  root=2645,
##D                  inBegin='2005-08-01',
##D                  inEnd='2005-10-31',
##D                  outBegin='2005-08-01',
##D                  outEnd='2005-10-31')
##D 
##D ## Check that the result is identical
##D identical(trace.1, trace.2)
##D 
##D ## Show result of contact tracing
##D show(trace.1)
##D 
##D ## Create a network summary for all included herds
##D ## First extract all source and destination from the dataset
##D root <- sort(unique(c(transfers$source,
##D                       transfers$destination)))
##D 
##D ## Perform contact tracing using tEnd and days.
##D trace.3 <- Trace(movements=transfers,
##D                  root=root,
##D                  tEnd='2005-10-31',
##D                  days=91)
##D 
##D ## Perform contact tracing using inBegin, inEnd
##D ## outBegin and outEnd
##D trace.4 <- Trace(movements=transfers,
##D                  root=root,
##D                  inBegin=rep('2005-08-01', length(root)),
##D                  inEnd=rep('2005-10-31', length(root)),
##D                  outBegin=rep('2005-08-01', length(root)),
##D                  outEnd=rep('2005-10-31', length(root)))
##D 
##D ## Check that the result is identical
##D identical(trace.3, trace.4)
##D 
##D NetworkSummary(trace.3)
## End(Not run)




