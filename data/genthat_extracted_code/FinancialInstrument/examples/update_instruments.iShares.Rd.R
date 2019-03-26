library(FinancialInstrument)


### Name: update_instruments.iShares
### Title: update iShares and SPDR ETF metadata
### Aliases: update_instruments.iShares update_instruments.SPDR

### ** Examples

## Not run: 
##D stock("IWC", currency("USD"))
##D update_instruments.iShares("IWC")
##D getInstrument("IWC")
##D 
##D Symbols <- stock(c("SPY", "JNK"), currency("USD"))
##D update_instruments.SPDR(Symbols)
##D buildHierarchy(c("SPY", "JNK"), "Name")
## End(Not run)



