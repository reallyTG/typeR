library(rugarch)


### Name: autoarfima
### Title: Automatic Model Selection for ARFIMA models
### Aliases: autoarfima

### ** Examples

## Not run: 
##D data(sp500ret)
##D fit = autoarfima(data = sp500ret[1:1000,], ar.max = 2, ma.max = 2, 
##D criterion = "AIC", method = "full")
## End(Not run)


