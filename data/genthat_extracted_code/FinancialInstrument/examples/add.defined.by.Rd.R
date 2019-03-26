library(FinancialInstrument)


### Name: add.defined.by
### Title: Add a source to the defined.by field of an 'instrument'
### Aliases: add.defined.by

### ** Examples

## Not run: 
##D update_instruments.TTR("GS")
##D getInstrument("GS")$defined.by #TTR
##D add.defined.by("GS", "gsee", "demo")
##D add.defined.by("GS", "gsee;demo") #same
## End(Not run)



