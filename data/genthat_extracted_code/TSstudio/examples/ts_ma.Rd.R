library(TSstudio)


### Name: ts_ma
### Title: Moving Average Method for Time Series Data
### Aliases: ts_ma

### ** Examples

## Not run: 
##D # A one-side moving average order of 7
##D USgas_MA7 <- ts_ma(USgas, n_left = 6, n = NULL)
##D 
##D # A two-sided moving average order of 13
##D USgas_two_side_MA <- ts_ma(USgas, n = 6)
##D 
##D # Unbalanced moving average of order 12
##D  USVSales_MA12 <- ts_ma(USVSales, n_left = 6, n_right = 5, n = NULL, 
##D  title = "US Monthly Total Vehicle Sales - MA", 
##D  Ytitle = "Thousand of Units")
##D 
##D # Adding double MA of order 2 to balanced the series:
##D USVSales_MA12 <- ts_ma(USVSales, n_left = 6, n_right = 5, n = NULL, 
##D  double = 2,
##D  title = "US Monthly Total Vehicle Sales - MA", 
##D  Ytitle = "Thousand of Units")
##D 
##D # Adding several types of two-sided moving averages along with the unblanced
##D # Plot each on a separate plot
##D USVSales_MA12 <- ts_ma(USVSales, n_left = 6, n_right = 5, n = c(3, 6, 9), 
##D double = 2, multiple = TRUE,
##D title = "US Monthly Total Vehicle Sales - MA", 
##D Ytitle = "Thousand of Units")
## End(Not run)



