library(FinancialInstrument)


### Name: ls_instruments_by
### Title: Subset names of instruments
### Aliases: ls_instruments_by

### ** Examples


## Not run: 
##D stock(c("GOOG","INTC"),currency("USD"))
##D synthetic("SnP","USD",src=list(name='^GSPC',src='yahoo'))
##D ls_instruments_by('type','stock')
##D ls_instruments_by("name",NULL,in.slot='src')
##D ls_instruments_by('src',NULL)
## End(Not run)



