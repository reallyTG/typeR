library(rdfp)


### Name: dfp_getDeliveryForecast
### Title: getDeliveryForecast
### Aliases: dfp_getDeliveryForecast

### ** Examples

## Not run: 
##D filter <- "WHERE Status='DELIVERING' LIMIT 1"
##D one_li <- dfp_getLineItemsByStatement(list(filterStatement=list(query=filter)))[[1]]
##D hypothetical_line_item <- list(lineItem=
##D                                list(id=one_li$id,
##D                                     startDateTime=one_li$startDateTime,
##D                                     endDateTime=dfp_date_to_list(Sys.Date()+100),
##D                                     lineItemType=one_li$lineItemType,
##D                                     costType=one_li$costType, 
##D                                     primaryGoal=one_li$primaryGoal, 
##D                                     targeting=one_li$targeting))
##D request_data <- list(lineItems=hypothetical_line_item,
##D                      forecastOptions=list(ignoredLineItemIds=NULL))
##D dfp_getDeliveryForecast_result <- dfp_getDeliveryForecast(request_data)
## End(Not run)



