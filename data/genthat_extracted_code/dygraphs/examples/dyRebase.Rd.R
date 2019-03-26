library(dygraphs)


### Name: dyRebase
### Title: Rebase data handler for straw broom charts with Dygraph
### Aliases: dyRebase

### ** Examples

## Not run: 
##D library(quantmod)
##D tickers <- c("AAPL", "MSFT")
##D getSymbols(tickers)
##D closePrices <- do.call(merge, lapply(tickers, function(x) Cl(get(x))))
##D dateWindow <- c("2008-01-01", "2009-01-01")
##D dygraph(closePrices, main = "Value", group = "stock") %>%
##D   dyRebase(value = 100) %>%
##D   dyRangeSelector(dateWindow = dateWindow)
##D dygraph(closePrices, main = "Percent", group = "stock") %>%
##D   dyRebase(percent = TRUE) %>%
##D   dyRangeSelector(dateWindow = dateWindow)
##D dygraph(closePrices, main = "None", group = "stock") %>%
##D   dyRangeSelector(dateWindow = dateWindow)
## End(Not run)




