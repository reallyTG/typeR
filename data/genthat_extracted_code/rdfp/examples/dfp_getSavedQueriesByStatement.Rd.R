library(rdfp)


### Name: dfp_getSavedQueriesByStatement
### Title: getSavedQueriesByStatement
### Aliases: dfp_getSavedQueriesByStatement

### ** Examples

## Not run: 
##D request_data <- list(filterStatement=list(query="WHERE id = 936165016"))
##D this_result <- dfp_getSavedQueriesByStatement(request_data, as_df=FALSE)
##D this_report_query <- this_result[[1]]$reportQuery
##D 
##D # resubmit the report job with the saved query
##D report_data <- list(reportJob=list(reportQuery = this_report_query))
##D report_data <- dfp_full_report_wrapper(report_data)
## End(Not run)



