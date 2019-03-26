library(quantmod)


### Name: getSymbols
### Title: Load and Manage Data from Multiple Sources
### Aliases: getSymbols getSymbols.Bloomberg loadSymbols showSymbols
###   removeSymbols saveSymbols
### Keywords: data

### ** Examples

## Not run: 
##D setSymbolLookup(QQQ='yahoo',SPY='google')
##D 
##D # loads QQQQ from yahoo (set with setSymbolLookup)
##D # loads SPY from MySQL (set with setSymbolLookup)
##D getSymbols(c('QQQ','SPY'))                
##D 
##D # loads Ford market data from yahoo (the formal default)
##D getSymbols('F')       
##D 
##D # loads symbol from MySQL database (set with setDefaults)
##D getSymbols('DIA', verbose=TRUE, src='MySQL')                 
##D 
##D # loads Ford as time series class ts 
##D getSymbols('F',src='yahoo',return.class='ts') 
##D 
##D # load into a new environment
##D data.env <- new.env()
##D getSymbols("YHOO", env=data.env)
##D ls.str(data.env)
##D 
##D # constrain to local scope
##D try(local( {
##D   getSymbols("AAPL")  # or getSymbols("AAPL", env=environment())
##D   str(AAPL)
##D   }))
##D 
##D exists("AAPL")  # FALSE
##D 
##D # assign into an attached environment
##D attach(NULL, name="DATA.ENV")
##D getSymbols("AAPL", env=as.environment("DATA.ENV"))
##D ls("DATA.ENV")
##D detach("DATA.ENV")
##D 
##D # directly return to caller
##D str( getSymbols("AAPL", env=NULL) )
##D str( getSymbols("AAPL", auto.assign=FALSE) )  # same
##D 
## End(Not run)



