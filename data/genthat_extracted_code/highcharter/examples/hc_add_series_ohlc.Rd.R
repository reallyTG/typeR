library(highcharter)


### Name: hc_add_series_ohlc
### Title: Shortcut for create candlestick charts
### Aliases: hc_add_series_ohlc

### ** Examples

  

## Not run: 
##D 
##D library("xts")
##D 
##D data(sample_matrix)
##D 
##D matrix_xts <- as.xts(sample_matrix, dateFormat = "Date")
##D 
##D head(matrix_xts)
##D 
##D class(matrix_xts)
##D 
##D highchart() %>% 
##D   hc_add_series_ohlc(matrix_xts)
##D    
##D library("quantmod")
##D 
##D x <- getSymbols("AAPL", auto.assign = FALSE)
##D y <- getSymbols("SPY", auto.assign = FALSE)
##D 
##D highchart() %>% 
##D   hc_add_series_ohlc(x) %>% 
##D   hc_add_series_ohlc(y)
##D   
## End(Not run)
  



