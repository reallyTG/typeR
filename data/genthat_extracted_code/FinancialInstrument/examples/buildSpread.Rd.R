library(FinancialInstrument)


### Name: buildSpread
### Title: Construct a price/level series for pre-defined multi-leg spread
###   instrument
### Aliases: buildSpread buildBasket

### ** Examples

## Not run: 
##D currency("USD")
##D stock("SPY","USD",1)
##D stock("DIA","USD",1)
##D getSymbols(c("SPY","DIA")) 
##D 
##D spread("SPYDIA", "USD", c("SPY","DIA"),c(1,-1)) #define it.
##D buildSpread('SPYDIA') #build it.
##D head(SPYDIA)
##D 
## End(Not run)



