library(googleAnalyticsR)


### Name: fetch_google_analytics_4
### Title: Fetch multiple GAv4 requests
### Aliases: fetch_google_analytics_4

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
##D ga_req1 <- make_ga_4_req(ga_id, 
##D                          date_range = c("2015-07-30","2015-10-01"),
##D                          dimensions=c('source','medium'), 
##D                          metrics = c('sessions'))
##D 
##D ga_req2 <- make_ga_4_req(ga_id, 
##D                          date_range = c("2015-07-30","2015-10-01"),
##D                          dimensions=c('source','medium'), 
##D                          metrics = c('users'))
##D                          
##D fetch_google_analytics_4(list(ga_req1, ga_req2))
##D 
## End(Not run)




