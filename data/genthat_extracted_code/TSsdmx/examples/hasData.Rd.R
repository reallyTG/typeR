library(TSsdmx)


### Name: hasData
### Title: Functions to Check a Returned Time Series Data Object
### Aliases: hasData hasDataCount hasDataNames hasDataDescriptions
### Keywords: ts

### ** Examples

  ## Not run: 
##D   require("TSsdmx")
##D   eurostat <- TSconnect("sdmx", dbname="EUROSTAT")
##D 
##D   # 28 series, 23 with data
##D   z <-  TSget("ei_nama_q.Q.MIO-EUR.NSA.CP.*.IT", eurostat) 
##D 
##D   sum(hasData(z, quiet=TRUE)) 
##D 
##D   hasDataCount(z)
##D   hasDataNames(z)
##D 
##D   hasDataDescriptions(z)
##D   
## End(Not run)



