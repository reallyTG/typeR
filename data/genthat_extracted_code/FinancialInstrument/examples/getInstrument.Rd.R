library(FinancialInstrument)


### Name: getInstrument
### Title: Primary accessor function for getting objects of class
###   'instrument'
### Aliases: getInstrument

### ** Examples

## Not run: 
##D option('..VX', multiplier=100, 
##D   underlying_id=future('.VX',multiplier=1000, 
##D     underlying_id=synthetic('VIX', currency("USD"))))
##D 
##D getInstrument("VIX")
##D getInstrument('VX') #returns the future
##D getInstrument("VX",type='option')
##D getInstrument('..VX') #finds the option
## End(Not run)



