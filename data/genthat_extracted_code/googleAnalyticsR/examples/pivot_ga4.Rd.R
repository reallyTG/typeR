library(googleAnalyticsR)


### Name: pivot_ga4
### Title: Make a pivot object
### Aliases: pivot_ga4

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
##D ## filter pivot results to 
##D pivot_dim_filter1 <- dim_filter("medium",
##D                                 "REGEXP",
##D                                 "organic|social|email|cpc")
##D                                 
##D                                 
##D pivot_dim_clause <- filter_clause_ga4(list(pivot_dim_filter1))
##D 
##D pivme <- pivot_ga4("medium",
##D                    metrics = c("sessions"), 
##D                    maxGroupCount = 4, 
##D                   dim_filter_clause = pivot_dim_clause)
##D                   
##D                   
##D pivtest <- google_analytics(ga_id, 
##D                             c("2016-01-30","2016-10-01"), 
##D                             dimensions=c('source'), 
##D                             metrics = c('sessions'), 
##D                             pivots = list(pivme))
##D 
## End(Not run)





