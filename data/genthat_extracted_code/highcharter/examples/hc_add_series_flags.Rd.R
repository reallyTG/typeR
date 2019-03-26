library(highcharter)


### Name: hc_add_series_flags
### Title: Shortcut for add flags to highstock chart
### Aliases: hc_add_series_flags

### ** Examples



## Not run: 
##D 
##D library("quantmod")
##D 
##D usdjpy <- getSymbols("USD/JPY", src="oanda", auto.assign = FALSE)
##D 
##D dates <- as.Date(c("2015-05-08", "2015-09-12"), format = "%Y-%m-%d")
##D highchart(type = "stock") %>% 
##D   hc_add_series_xts(usdjpy, id = "usdjpy") %>% 
##D   hc_add_series_flags(dates,
##D                       title = c("E1", "E2"), 
##D                       text = c("This is event 1", "This is the event 2"),
##D                       id = "usdjpy") 
## End(Not run)
                      



