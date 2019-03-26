library(rdfp)


### Name: dfp_getAvailabilityForecastById
### Title: getAvailabilityForecastById
### Aliases: dfp_getAvailabilityForecastById

### ** Examples

## Not run: 
##D filter <- "WHERE Status='DELIVERING' LIMIT 1"
##D one_li <- dfp_getLineItemsByStatement(list(filterStatement=list(query=filter)))[[1]]
##D request_data <- list(lineItemId=one_li$id,
##D                      forecastOptions=list(includeTargetingCriteriaBreakdown='true', 
##D                                           includeContendingLineItems='true'))
##D result <- dfp_getAvailabilityForecastById(request_data)
## End(Not run)



