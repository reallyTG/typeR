library(FinancialInstrument)


### Name: update_instruments.morningstar
### Title: Update instrument metadata for ETFs
### Aliases: update_instruments.morningstar update_instruments.ms

### ** Examples

## Not run: 
##D ## backup .instrument environment
##D ibak <- as.list(FinancialInstrument:::.instrument) 
##D rm_instruments()
##D stock(s <- c("SPY", "USO", "LQD"), currency("USD"))
##D update_instruments.morningstar(s)
##D instrument.table(s)
##D ## cleanup and restore instrument environment
##D rm_instruments(keep.currencies=FALSE)
##D loadInstruments(ibak)
## End(Not run)



