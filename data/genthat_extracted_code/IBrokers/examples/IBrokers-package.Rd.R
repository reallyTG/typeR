library(IBrokers)


### Name: IBrokers-package
### Title: R API to the Interactive Brokers Trader Workstation (TWS).
### Aliases: IBrokers-package IBrokers IBrokersRef
### Keywords: package

### ** Examples

## Not run: 
##D IBrokersRef()       # IBrokers Reference Card in PDF viewer
##D 
##D tws <- twsConnect() # make a new connection to the TWS
##D reqCurrentTime(tws) # check the server's timestamp
##D 
##D contract <- twsEquity('IBKR','SMART','ISLAND') # equity specification
##D 
##D reqHistoricalData(tws,contract) # request historical data
##D twsDisconnect(tws)  # disconnect from the TWS
## End(Not run)



