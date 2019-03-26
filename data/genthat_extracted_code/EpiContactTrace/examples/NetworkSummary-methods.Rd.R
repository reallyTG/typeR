library(EpiContactTrace)


### Name: NetworkSummary
### Title: 'NetworkSummary'
### Aliases: NetworkSummary NetworkSummary,ContactTrace-method
###   NetworkSummary,data.frame-method
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
##D ## Calculate network summary from a ContactTrace object
##D ns.1 <- NetworkSummary(contactTrace)
##D 
##D ## Calculate network summary using tEnd and days
##D ns.2 <- NetworkSummary(transfers,
##D                        root=2645,
##D                        tEnd='2005-10-31',
##D                        days=91)
##D 
##D ## Check that the result is identical
##D identical(ns.1, ns.2)
##D 
##D ## Calculate network summary using inBegin, inEnd
##D ## outBegin and outEnd
##D ns.3 <- NetworkSummary(transfers,
##D                        root=2645,
##D                        inBegin='2005-08-01',
##D                        inEnd='2005-10-31',
##D                        outBegin='2005-08-01',
##D                        outEnd='2005-10-31')
##D 
##D ## Check that the result is identical
##D identical(ns.2, ns.3)
##D 
##D ## When calculating the network summary for a data.frame of movements
##D ## a data.frame for each combination of root, tEnd and days are returned.
##D root <- c(1,2,3)
##D tEnd <- c("2005-09-01", "2005-10-01")
##D days <- c(30, 45)
##D 
##D ## The network summary are calculated at the following
##D ## 12 combinations.
##D ## root = 1, tEnd = "2005-09-01", days = 30
##D ## root = 1, tEnd = "2005-09-01", days = 45
##D ## root = 1, tEnd = "2005-10-01", days = 30
##D ## root = 1, tEnd = "2005-10-01", days = 45
##D ## root = 2, tEnd = "2005-09-01", days = 30
##D ## root = 2, tEnd = "2005-09-01", days = 45
##D ## root = 2, tEnd = "2005-10-01", days = 30
##D ## root = 2, tEnd = "2005-10-01", days = 45
##D ## root = 3, tEnd = "2005-09-01", days = 30
##D ## root = 3, tEnd = "2005-09-01", days = 45
##D ## root = 3, tEnd = "2005-10-01", days = 30
##D ## root = 3, tEnd = "2005-10-01", days = 45
##D NetworkSummary(transfers, root, tEnd, days)
##D 
##D ## Create a network summary for all included herds
##D ## First extract all source and destination from the dataset
##D root <- sort(unique(c(transfers$source,
##D                       transfers$destination)))
##D 
##D ## Perform contact tracing using tEnd and days
##D result.1 <- NetworkSummary(transfers,
##D                            root=root,
##D                            tEnd='2005-10-31',
##D                            days=90)
##D 
##D ## Perform contact tracing using inBegin, inEnd, outBegin and outEnd.
##D result.2 <- NetworkSummary(transfers,
##D                            root=root,
##D                            inBegin=rep('2005-08-02', length(root)),
##D                            inEnd=rep('2005-10-31', length(root)),
##D                            outBegin=rep('2005-08-02', length(root)),
##D                            outEnd=rep('2005-10-31', length(root)))
## End(Not run)



