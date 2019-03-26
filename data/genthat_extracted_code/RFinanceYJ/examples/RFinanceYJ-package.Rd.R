library(RFinanceYJ)


### Name: RFinanceYJ-package
### Title: Japanese finance market from Yahoo!-finance-Japan
### Aliases: RFinanceYJ-package RFinanceYJ
### Keywords: package

### ** Examples

## Not run: 
##D stock <- quoteStockTsData('4689.t')
##D head(stock)
##D stock <- quoteStockTsData('4689.t', since='2013-01-01')
##D head(stock)
##D stock <- quoteStockTsData('4689.t', since='2013-01-01',time.interval='monthly')
##D head(stock)
##D plot(stock$date, stock$close, type="l", col="blue")
## End(Not run)



