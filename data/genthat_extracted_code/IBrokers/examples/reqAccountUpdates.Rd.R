library(IBrokers)


### Name: reqAccountUpdates
### Title: Request Account Updates
### Aliases: reqAccountUpdates cancelAccountUpdates twsPortfolioValue
###   .reqAccountUpdates
### Keywords: misc utilities

### ** Examples

## Not run: 
##D   tws <- twsConnect()
##D 
##D   reqAccountUpdates(tws)        # this will return a AccountUpdate object
##D   .reqAccountUpdates(tws)       # this will return immediately
##D 
##D   .reqAccountUpdates(tws, FALSE)  # cancel the request
##D   cancelAccountUpdates(tws)     # the same
##D 
##D   twsDisconnect(tes)
## End(Not run)



