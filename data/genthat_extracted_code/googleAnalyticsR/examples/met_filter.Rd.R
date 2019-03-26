library(googleAnalyticsR)


### Name: met_filter
### Title: Make a metric filter object
### Aliases: met_filter

### ** Examples


## Not run: 
##D library(googleAnalyticsR)
##D 
##D ## authenticate,
##D ## or use the RStudio Addin "Google API Auth" with analytics scopes set
##D ga_auth()
##D 
##D ## get your accounts
##D account_list <- google_analytics_account_list()
##D 
##D ## pick a profile with data to query
##D 
##D ga_id <- account_list[23,'viewId']
##D 
##D ## create filters on metrics
##D mf <- met_filter("bounces", "GREATER_THAN", 0)
##D mf2 <- met_filter("sessions", "GREATER", 2)
##D 
##D ## create filters on dimensions
##D df <- dim_filter("source","BEGINS_WITH","1",not = TRUE)
##D df2 <- dim_filter("source","BEGINS_WITH","a",not = TRUE)
##D 
##D ## construct filter objects
##D fc2 <- filter_clause_ga4(list(df, df2), operator = "AND")
##D fc <- filter_clause_ga4(list(mf, mf2), operator = "AND")
##D 
##D ## make v4 request
##D ga_data1 <- google_analytics_4(ga_id,
##D                                date_range = c("2015-07-30","2015-10-01"),
##D                                dimensions=c('source','medium'),
##D                                metrics = c('sessions','bounces'),
##D                                met_filters = fc,
##D                                dim_filters = fc2,
##D                                filtersExpression = "ga:source!=(direct)")
##D 
## End(Not run)




