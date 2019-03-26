library(RCriteo)


### Name: RCriteo
### Title: Loading Criteo Data into R
### Aliases: RCriteo
### Keywords: ~Criteo ~Criteo API ~RCriteo

### ** Examples

## Not run: 
##D Authentication:
##D authToken <- doCriteoAuth(user = "userName",
##D                             password = "**********",
##D                             company = "companyName",
##D                             app = "appName",
##D                             version = "3.6")
##D Retrieve Campaign IDs:
##D getCriteoCampaigns(authToken = authToken,
##D                       appToken = '*************')
##D Create Statement:
##D jobID <- scedCriteoReport(authToken = authToken,
##D                       appToken = '*************',
##D                       campaigns = c("12345", "23345", "98765", "45639"),
##D                       metrics = c("clicks", "impressions", "cost", "sales"),
##D                       start = "2015-09-01",
##D                       end = "2015-09-06")
##D Download Data:
##D data <- criteoData(authToken = authToken,
##D                     appToken = '*************',
##D                     jobID = jobID)
## End(Not run)



