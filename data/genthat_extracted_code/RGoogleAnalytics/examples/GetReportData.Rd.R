library(RGoogleAnalytics)


### Name: GetReportData
### Title: Query the Google Analytics API for the specified dimensions,
###   metrics and other query parameters
### Aliases: GetReportData

### ** Examples

## Not run: 
##D # This example assumes that a token object is already created
##D 
##D # Create a list of Query Parameters
##D query.list <- Init(start.date = "2014-11-28",
##D                    end.date = "2014-12-04",
##D                    dimensions = "ga:date",
##D                    metrics = "ga:sessions,ga:pageviews",
##D                    max.results = 1000,
##D                    table.id = "ga:33093633")
##D 
##D # Create the query object
##D ga.query <- QueryBuilder(query.list)
##D 
##D # Fire the query to the Google Analytics API
##D ga.df <- GetReportData(query, oauth_token)
##D ga.df <- GetReportData(query, oauth_token, split_daywise=True)
##D ga.df <- GetReportData(query, oauth_token, paginate_query=True)
## End(Not run)




