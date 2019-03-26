library(IBrokers)


### Name: reqRealTimeBars
### Title: Request Real Time Bars from TWS
### Aliases: reqRealTimeBars cancelRealTimeBars
### Keywords: utilities

### ** Examples

## Not run: 
##D tws <- twsConnect()
##D contract <- twsEquity("QQQQ","SMART","ISLAND")
##D reqRealTimeBars(tws, contract)
##D 
##D # write to an open file connection
##D fh <- file('out.dat',open='a')
##D reqRealTimeBars(tws, contract, file=fh)
##D close(fh)
## End(Not run)



