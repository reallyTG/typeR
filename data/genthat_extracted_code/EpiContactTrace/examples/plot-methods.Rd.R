library(EpiContactTrace)


### Name: plot-methods
### Title: plot,-method
### Aliases: plot-methods plot plot,ContactTrace-method

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
##D ## Plot in- and outgoing contact chain for the root 2645
##D plot(contactTrace)
##D 
## End(Not run)



