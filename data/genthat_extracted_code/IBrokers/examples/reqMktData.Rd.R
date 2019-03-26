library(IBrokers)


### Name: reqMktData
### Title: Request Market Data Feed from TWS
### Aliases: reqMktData cancelMktData
### Keywords: utilities

### ** Examples

## Not run: 
##D tws <- twsConnect()
##D contract <- twsEquity("QQQQ","SMART","ISLAND")
##D reqMktData(tws, contract)
##D 
##D # write to an open file connection
##D fh <- file('out.dat',open='a')
##D reqMktData(tws, contract, file=fh)
##D close(fh)
## End(Not run)



