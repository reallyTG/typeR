library(FinancialInstrument)


### Name: add.identifier
### Title: Add an identifier to an 'instrument'
### Aliases: add.identifier

### ** Examples

## Not run: 
##D stock("XXX", currency("USD"))
##D add.identifier("XXX", yahoo="^XXX") 
##D getInstrument("^XXX")
##D add.identifier("^XXX", "x3")
##D all.equal(getInstrument("x3"), getInstrument("XXX")) #TRUE
## End(Not run)



