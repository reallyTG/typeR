library(FinancialInstrument)


### Name: update_instruments.instrument
### Title: Update instruments with metadata from another instrument.
### Aliases: update_instruments.instrument

### ** Examples

## Not run: 
##D #rm_instruments()
##D currency("USD")
##D synthetic("SPX", "USD", identifiers=list(yahoo="GSPC"),
##D           tick_size=0.01,
##D          liquidHours="T08:30:00/T15:00:00", 
##D          extraField='something else', 
##D          assign_i=TRUE)
##D stock("SPY", "USD", liquidHours="", assign_i=TRUE)
##D all.equal(getInstrument("SPX"), getInstrument("SPY"))
##D getInstrument("SPY")
##D ## update SPY metadata based on the metadata of SPX
##D ## Only attributes that == "" are updated by default
##D update_instruments.instrument("SPY", "SPX", assign_i=FALSE) #liquidHours
##D update_instruments.instrument("SPY", "SPX", create.new=TRUE,
##D                               ignore=c("identifiers", "type"), 
##D                               assign_i=FALSE)
##D # Although you probably do NOT want to, this will
##D # copy everything new -- including identifiers and type!
##D update_instruments.instrument("SPY", "SPX", create.new=TRUE, ignore=NULL, 
##D                               assign_i=FALSE) 
## End(Not run)



