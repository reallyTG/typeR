library(IBrokers)


### Name: reqHistoricalData
### Title: Request Historical Data From TWS
### Aliases: reqHistoricalData reqHistory cancelHistoricalData
### Keywords: utilities

### ** Examples

## Not run: 
##D tws <- twsConnect()
##D contract <- twsEquity('QQQQ','SMART','ISLAND')
##D 
##D # by default retreives 30 days of daily data
##D reqHistoricalData(tws, Contract=contract)
##D 
##D # by default retreives a year of 1 minute bars
##D Sys.sleep(10) # mandatory 10s between request to avoid IB pacing violation
##D reqHistory(tws, Contract=contract)
##D 
## End(Not run)



