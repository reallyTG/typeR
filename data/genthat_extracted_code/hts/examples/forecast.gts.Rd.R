library(hts)


### Name: forecast.gts
### Title: Forecast a hierarchical or grouped time series
### Aliases: forecast.gts forecast.hts
### Keywords: ts

### ** Examples


forecast(htseg1, h = 10, method = "bu", fmethod = "arima")

## Not run: 
##D   forecast(
##D     htseg2, h = 10, method = "comb", algorithms = "lu",
##D     FUN = function(x) tbats(x, use.parallel = FALSE)
##D   )
## End(Not run)




