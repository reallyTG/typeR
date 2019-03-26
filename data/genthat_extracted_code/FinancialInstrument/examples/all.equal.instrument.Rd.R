library(FinancialInstrument)


### Name: all.equal.instrument
### Title: instrument all.equal method
### Aliases: all.equal.instrument
### Keywords: internal utilities

### ** Examples

## Not run: 
##D currency("USD")
##D stock("SPY", "USD", validExchanges=c("SMART", "ARCA", "BATS", "BEX"))
##D stock("DIA", "USD", validExchanges=c("SMART", "ARCA", "ISLAND"), 
##D      ExtraField="something")
##D 
##D all.equal(getInstrument("SPY"), getInstrument("DIA"))
##D all.equal(getInstrument("SPY"), getInstrument("DIA"), char.n=5)
##D all.equal(getInstrument("SPY"), getInstrument("DIA"), char.n=5, collapse=NULL)
##D 
##D all.equal(getInstrument("DIA"), getInstrument("USD"))
## End(Not run)



