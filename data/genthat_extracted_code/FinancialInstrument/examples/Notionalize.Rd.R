library(FinancialInstrument)


### Name: Notionalize
### Title: Convert price series to/from notional value
### Aliases: Notionalize Denotionalize

### ** Examples

## Not run: 
##D source("http://tinyurl.com/download-tblox")
##D getSymbols("CL", src='tblox')
##D define_futures.tblox()
##D tail(Notionalize(CL, "CL"))
##D tail(Denotionalize(Notionalize(CL), "CL"))
## End(Not run)



