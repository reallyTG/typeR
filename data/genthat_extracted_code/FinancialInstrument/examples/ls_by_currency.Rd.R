library(FinancialInstrument)


### Name: ls_by_currency
### Title: shows or removes instruments of given currency denomination(s)
### Aliases: ls_by_currency rm_by_currency ls_USD ls_AUD ls_GBP ls_CAD
###   ls_EUR ls_JPY ls_CHF ls_HKD ls_SEK ls_NZD rm_by_currency ls_USD
###   ls_AUD ls_GBP ls_CAD ls_EUR ls_JPY ls_CHF ls_HKD ls_SEK ls_NZD

### ** Examples


## Not run: 
##D #First create instruments
##D currency(c('USD','CAD','GBP')
##D stock(c('CM','CNQ'),'CAD')
##D stock(c('BET','BARC'),'GBP')
##D stock(c('SPY','DIA'),'USD')
##D 
##D #now the examples
##D ls_by_currency(c('CAD','GBP'))
##D 
##D ls_USD()
##D ls_CAD()
##D 
##D #2 ways to remove all instruments of a currency
##D rm_instruments(ls_USD()) 
##D #rm_instruments(ls_GBP(),keep.currencies=FALSE)
##D rm_by_currency( ,'CAD') 
##D #rm_by_currency( ,'CAD', keep.currencies=FALSE)
## End(Not run)



