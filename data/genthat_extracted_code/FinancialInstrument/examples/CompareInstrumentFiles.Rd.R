library(FinancialInstrument)


### Name: CompareInstrumentFiles
### Title: Compare Instrument Files
### Aliases: CompareInstrumentFiles

### ** Examples

## Not run: 
##D #backup current .instrument environment
##D bak <- as.list(FinancialInstrument:::.instrument, all.names=TRUE) 
##D old.wd <- getwd()
##D tmpdir <- tempdir()
##D setwd(tmpdir)
##D rm_instruments(keep=FALSE)
##D # create some instruments and save
##D stock(c("SPY", "DIA", "GLD"), currency("USD"))
##D saveInstruments("MyInstruments1")
##D # make some changes
##D rm_stocks("GLD")
##D stock("QQQ", "USD")
##D instrument_attr("SPY", "description", "S&P ETF")
##D saveInstruments("MyInstruments2")
##D CompareInstrumentFiles("MyInstruments1", "MyInstruments2")
##D #Clean up
##D setwd(old.wd)
##D reloadInstruments(bak)
## End(Not run)



