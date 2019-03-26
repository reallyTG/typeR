library(IBrokers)


### Name: reqMktDepth
### Title: Request Market Depth Feed from TWS
### Aliases: reqMktDepth cancelMktDepth
### Keywords: utilities

### ** Examples

## Not run: 
##D tws <- twsConnect()
##D contract <- twsEquity("QQQQ","SMART","ISLAND")
##D reqMktDepth(tws, contract)
##D 
##D # write to a file
##D reqMktDepth(tws, contract, file='out.dat')
## End(Not run)



