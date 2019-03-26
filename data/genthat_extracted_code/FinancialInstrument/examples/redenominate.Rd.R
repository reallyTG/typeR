library(FinancialInstrument)


### Name: redenominate
### Title: Redenominate (change the base of) an instrument
### Aliases: redenominate

### ** Examples


## Not run: 
##D require(quantmod)
##D EURUSD <- getSymbols("EURUSD=x",src='yahoo',auto.assign=FALSE)
##D GLD <- getSymbols("GLD", src='yahoo', auto.assign=FALSE)
##D GLD.EUR <- redenominate(GLD,"EUR","USD") #can call with xts object
##D 
##D currency("USD")
##D stock("GLD","USD")
##D GLD.EUR <- redenominate('GLD','EUR') #can also call with instrument name
## End(Not run)



