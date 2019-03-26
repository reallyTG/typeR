library(FinancialInstrument)


### Name: buildHierarchy
### Title: Construct a hierarchy of instruments useful for aggregation
### Aliases: buildHierarchy

### ** Examples

## Not run: 
##D # rm_instruments(keep.currencies=FALSE)
##D ## Define some stocks
##D update_instruments.TTR(c("XOM", "IBM", "CVX", "WMT", "GE"), exchange="NYSE")
##D 
##D buildHierarchy(ls_instruments(), "type")
##D buildHierarchy(ls_stocks(), c("Name", "Sector"))
##D buildHierarchy(ls_stocks(), "Industry", "MarketCap")
## End(Not run)



