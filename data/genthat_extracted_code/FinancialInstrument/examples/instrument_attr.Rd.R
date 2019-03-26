library(FinancialInstrument)


### Name: instrument_attr
### Title: Add or change an attribute of an instrument
### Aliases: instrument_attr

### ** Examples

## Not run: 
##D currency("USD")
##D stock("SPY","USD")
##D instrument_attr("USD","description","U.S. Dollar")
##D instrument_attr("SPY", "description", "An ETF")
##D getInstrument("USD")
##D getInstrument("SPY")
##D 
##D #Call with value=NULL to remove an attribute
##D instrument_attr("SPY", "description", NULL)
##D getInstrument("SPY")
##D 
##D instrument_attr("SPY","primary_id","SPX") #move/rename it
##D instrument_attr("SPX","type","synthetic") #re-class
##D instrument_attr("SPX","src",list(src='yahoo',name='^GSPC')) #setSymbolLookup
##D getSymbols("SPX") #knows where to look because the last line setSymbolLookup
##D getInstrument("SPX")
## End(Not run)



