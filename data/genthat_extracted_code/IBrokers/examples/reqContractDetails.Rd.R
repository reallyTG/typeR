library(IBrokers)


### Name: reqContractDetails
### Title: Request Contract Details From TWS
### Aliases: reqContractDetails
### Keywords: utilities

### ** Examples

## Not run: 
##D tws <- twsConnect()
##D reqContractDetails(tws, twsEquity("QQQQ"))
##D 
##D # retrieve all QQQQ contracts as a list
##D reqContractDetails(tws, twsOption(local="", right="", symbol="QQQQ"))
##D # retrieve only calls
##D reqContractDetails(tws, twsOption(local="", right="C", symbol="QQQQ"))
##D # retrieve only puts
##D reqContractDetails(tws, twsOption(local="", right="P", symbol="QQQQ"))
##D 
##D opt.details <- lapply(c("MSFT","AAPL"),
##D                       function(x) {
##D                                     reqContractDetails(tws,
##D                                       twsOption(local="", right="",
##D                                                 symbol=x))
##D                                   } )
##D 
##D length(opt.details) #number of symbols passed e.g. 2
##D sapply(opt.details, length) # contracts per symbol
## End(Not run)



