library(highcharter)


### Name: hc_add_series_xts
### Title: Shortcut for create highstock chart from 'xts' object
### Aliases: hc_add_series_xts

### ** Examples


## Not run: 
##D 
##D library("quantmod")
##D 
##D usdjpy <- getSymbols("USD/JPY", src="oanda", auto.assign = FALSE)
##D eurkpw <- getSymbols("EUR/KPW", src="oanda", auto.assign = FALSE)
##D 
##D highchart(type = "stock") %>% 
##D   hc_add_series_xts(usdjpy, id = "usdjpy") %>% 
##D   hc_add_series_xts(eurkpw, id = "eurkpw")
## End(Not run)




