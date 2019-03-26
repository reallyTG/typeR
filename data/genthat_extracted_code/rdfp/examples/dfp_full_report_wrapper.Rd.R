library(rdfp)


### Name: dfp_full_report_wrapper
### Title: Take report request and return data.frame
### Aliases: dfp_full_report_wrapper

### ** Examples

## Not run: 
##D request_data <- list(reportJob =
##D                        list(reportQuery =
##D                               list(dimensions = 'MONTH_AND_YEAR',
##D                                    dimensions = 'AD_UNIT_ID',
##D                                    dimensions = 'AD_UNIT_NAME',
##D                                    dimensions = 'ADVERTISER_NAME',
##D                                    dimensions = 'ORDER_NAME',
##D                                    dimensions = 'LINE_ITEM_NAME',
##D                                    adUnitView = 'FLAT',
##D                                    columns = 'AD_SERVER_IMPRESSIONS', 
##D                                    columns = 'AD_SERVER_CLICKS',
##D                                    dateRangeType = 'LAST_WEEK')))
##D report_data <- dfp_full_report_wrapper(request_data)
## End(Not run)



