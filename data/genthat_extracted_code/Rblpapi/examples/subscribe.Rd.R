library(Rblpapi)


### Name: subscribe
### Title: Subscribe to streaming market data
### Aliases: subscribe

### ** Examples

## Not run: 
##D   subscribe(securities=c("TYZ5 Comdty","/cusip/912810RE0@BGN"),
##D             fields=c("LAST_PRICE","BID","ASK"),
##D             fun=function(x) print(str(x$data)))
## End(Not run)



