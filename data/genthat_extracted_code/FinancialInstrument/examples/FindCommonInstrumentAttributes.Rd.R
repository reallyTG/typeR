library(FinancialInstrument)


### Name: FindCommonInstrumentAttributes
### Title: Find attributes that more than one instrument have in common
### Aliases: FindCommonInstrumentAttributes

### ** Examples

## Not run: 
##D ibak <- as.list(FinancialInstrument:::.instrument, all.names=TRUE)
##D Symbols <- c("SPY", "AAPL")
##D define_stocks(Symbols, addIBslot=FALSE)
##D update_instruments.SPDR("SPY")
##D update_instruments.TTR("AAPL", exchange="NASDAQ")
##D FindCommonInstrumentAttributes(Symbols)
##D FindCommonInstrumentAttributes(c(Symbols, "USD"))
##D reloadInstruments(ibak)
## End(Not run)



