library(RFinanceYJ)


### Name: quoteStockTsData
### Title: quote Japanese stock market from Yahoo!-finance-Japan
### Aliases: quoteStockTsData

### ** Examples

## Not run: 
##D stock <- quoteStockTsData('4689.t')
##D head(stock)
##D stock <- quoteStockTsData('4689.t', since='2009-01-01',date.end='2009-12-31')
##D head(stock)
##D stock <- quoteStockTsData('4689.t', since='2009-01-01',
##D                           date.end='2009-12-31',time.interval='monthly')
##D head(stock)
##D plot(stock$date, stock$close, type="l", col="blue")
## End(Not run)



