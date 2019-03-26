library(FinancialInstrument)


### Name: saveInstruments
### Title: Save and Load all instrument definitions
### Aliases: saveInstruments loadInstruments loadInstruments
###   reloadInstruments

### ** Examples

## Not run: 
##D stock("SPY", currency("USD"), 1)
##D tmpdir <- tempdir()
##D saveInstruments("MyInstruments.RData", dir=tmpdir)
##D rm_instruments(keep.currencies=FALSE)
##D loadInstruments("MyInstruments.RData", dir=tmpdir)
##D # write .R file that can be sourced
##D saveInstruments("MyInstruments.R", dir=tmpdir)
##D rm_instruments(keep.currencies=FALSE)
##D loadInstruments("MyInstruments.R", dir=tmpdir)
##D #source(file=paste(tmpdir, "MyInstruments.R", sep="/")) # same
##D unlink(tmpdir, recursive=TRUE)     
## End(Not run)



