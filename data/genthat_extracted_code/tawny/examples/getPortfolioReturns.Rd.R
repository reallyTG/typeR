library(tawny)


### Name: getPortfolioReturns
### Title: Utility functions for creating portfolios of returns and other
###   functions
### Aliases: getIndexComposition getPortfolioReturns ensure
### Keywords: ts

### ** Examples

## Not run: 
##D # Get a portfolio
##D h <- getPortfolioReturns(c('A','AA','AAPL'), obs=150)
##D 
##D # Get an index portfolio
##D h <- getPortfolioReturns(getIndexComposition('^DJI'), obs=100, reload=TRUE)
##D 
##D # Doesn't work because of numerical symbols - need to fix
##D #h <- getPortfolioReturns(getIndexComposition('^HSI'), obs=100, reload=TRUE)
##D 
##D # Ensure that some assets exist
##D ensure(c('K','JNPR'), src='yahoo')
## End(Not run)



