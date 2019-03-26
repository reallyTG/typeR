library(FinancialInstrument)


### Name: find.instrument
### Title: Find the primary_ids of instruments that contain certain strings
### Aliases: find.instrument

### ** Examples

## Not run: 
##D instruments.bak <- as.list(FinancialInstrument:::.instrument, all.names=TRUE)
##D rm_instruments(keep.currencies=FALSE)
##D currency("USD")
##D stock("SPY", "USD", description="S&P 500 ETF")
##D stock("DIA", "USD", description="DJIA ETF")
##D stock(c("AA", "AXP", "BA", "BAC", "CAT"), "USD", members.of='DJIA')
##D stock("BMW", currency("EUR"))
##D find.instrument("ETF")
##D find.instrument("DJIA") 
##D find.instrument("DJIA", "members.of")
##D find.instrument("USD")
##D find.instrument("EUR")
##D find.instrument("EUR", Symbols=ls_stocks())
##D find.instrument("USD", "type")
##D 
##D ## Can be combined with buildHierachy
##D buildHierarchy(find.instrument("ETF"), "type", "description")
##D 
##D ## Cleanup. restore previous instrument environment
##D rm_instruments(); rm_currencies()
##D loadInstruments(instruments.bak)
## End(Not run)



