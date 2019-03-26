library(FinancialInstrument)


### Name: fn_SpreadBuilder
### Title: Calculate prices of a spread from 2 instruments.
### Aliases: fn_SpreadBuilder

### ** Examples

## Not run: 
##D currency("USD")
##D stock("SPY", "USD")
##D stock("DIA", "USD")
##D getSymbols(c("SPY","DIA"))
##D 
##D #can call with names of instrument/xts ojects
##D fSB <- fn_SpreadBuilder("SPY","DIA") 
##D fSB2 <- fn_SpreadBuilder(SPY,DIA) # or you can pass xts objects
##D 
##D #assuming you first somehow calculated the ratio to be a constant 1.1
##D fSB3 <- fn_SpreadBuilder("SPY","DIA",1.1) 
##D head(fSB)
##D 
##D # Call fn_SpreadBuilder with vector of 2 instrument names
##D # in 1 arg instead of using both prod1 and prod2.
##D fSB4 <- fn_SpreadBuilder(c("SPY","DIA"))
##D #download data and plot the closing values of a spread in one line
##D chartSeries(Cl(fn_SpreadBuilder(getSymbols(c("SPY","DIA")),auto.assign=FALSE)))
## End(Not run)



