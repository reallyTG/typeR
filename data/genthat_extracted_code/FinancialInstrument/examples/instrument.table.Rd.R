library(FinancialInstrument)


### Name: instrument.table
### Title: Create data.frame with attributes of all instruments
### Aliases: instrument.table

### ** Examples


## Not run: 
##D currency('USD')
##D stock('GM','USD',exchange='NYSE')
##D stock('XOM','USD',description='Exxon Mobil')
##D instrument.table()
##D #Usually, currencies will not have as many attribute levels
##D #as other instruments, so you may want to exclude them from the table.
##D it <- instrument.table(exclude="USD|GM", attrs.of = "XOM") #columns created based on XOM instrument
##D #it <- instrument.table(exclude=c('USD','GM'), attrs.of = "XOM") #same thing
##D it <- instrument.table(exclude='tick_size|description|exchange')
## End(Not run)



