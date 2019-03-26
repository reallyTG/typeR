library(googleAnalyticsR)


### Name: make_cohort_group
### Title: Create a cohort group
### Aliases: make_cohort_group

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
##D 
##D ## first make a cohort group
##D 
##D cohort4 <- make_cohort_group(list("cohort 1" = c("2015-08-01", "2015-08-01"), 
##D                                   "cohort 2" = c("2015-07-01","2015-07-01")))
##D                                   
##D ## then call cohort report.  No date_range and must include metrics and dimensions
##D ##   from the cohort list
##D cohort_example <- google_analytics(ga_id, 
##D                                    dimensions=c('cohort'), 
##D                                    cohort = cohort4, 
##D                                    metrics = c('cohortTotalUsers'))
##D                                      
## End(Not run)




