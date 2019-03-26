library(googleAnalyticsR)


### Name: google_analytics
### Title: Get Google Analytics v4 data
### Aliases: google_analytics google_analytics_4

### ** Examples


## Not run: 
##D library(googleAnalyticsR)
##D 
##D ## authenticate, or use the RStudio Addin "Google API Auth" with analytics scopes set
##D 
##D ga_auth()
##D 
##D ## get your accounts
##D 
##D account_list <- google_analytics_account_list()
##D 
##D ## account_list will have a column called "viewId"
##D account_list$viewId
##D 
##D ## View account_list and pick the viewId you want to extract data from
##D ga_id <- 123456
##D 
##D ## simple query to test connection
##D google_analytics(ga_id, 
##D                  date_range = c("2017-01-01", "2017-03-01"), 
##D                  metrics = "sessions", 
##D                  dimensions = "date")
##D 
## End(Not run)




