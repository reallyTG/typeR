library(FinancialInstrument)


### Name: saveSymbols.days
### Title: Save data to disk
### Aliases: saveSymbols.days saveSymbols.common

### ** Examples

## Not run: 
##D getSymbols("SPY", src='yahoo')
##D dir.create("tmpdata")
##D saveSymbols.common("SPY", base_dir="tmpdata")
##D rm("SPY")
##D getSymbols("SPY", src='FI', dir="tmpdata", split_method='common')
##D unlink("tmpdata/SPY", recursive=TRUE)
## End(Not run)



