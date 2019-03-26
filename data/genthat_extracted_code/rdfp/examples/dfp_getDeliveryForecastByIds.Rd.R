library(rdfp)


### Name: dfp_getDeliveryForecastByIds
### Title: getDeliveryForecastByIds
### Aliases: dfp_getDeliveryForecastByIds

### ** Examples

## Not run: 
##D filter <- "WHERE Status='DELIVERING' LIMIT 1"
##D one_li <- dfp_getLineItemsByStatement(list(filterStatement=list(query=filter)))[[1]]
##D 
##D # not specifying forecastOptions brings up NotNullError.ARG2_NULL, so send, but keep null
##D request_data <- list(lineItemIds=one_li$id,
##D                      forecastOptions=list(ignoredLineItemIds=NULL))
##D result <- dfp_getDeliveryForecastByIds(request_data)
## End(Not run)



