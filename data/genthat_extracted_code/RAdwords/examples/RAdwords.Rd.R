library(RAdwords)


### Name: RAdwords
### Title: Loading Google Adwords Data into R
### Aliases: RAdwords
### Keywords: ~Adwords ~Google Adwords ~Adwords API ~Google Adwords API
###   ~Adwords Report ~Google Adwords Report

### ** Examples

## Not run: 
##D Authentication:
##D google_auth <- doAuth()
##D Create Statement:
##D body <- statement(select = c('Clicks','AveragePosition','Cost','Ctr'),
##D                   report = "ACCOUNT_PERFORMANCE_REPORT",
##D                   start = "2018-01-01",
##D                   end = "2018-01-10")
##D Query Adwords API and load data as dataframe:
##D data <- getData(clientCustomerId = 'xxx-xxx-xxxx', #use Adwords Account Id (MCC Id will not work)
##D                 google_auth = google_auth,
##D                 statement = body)
##D Get available report types:
##D reports()
##D Get available metrics/attributes of specific report type:
##D metrics(report = 'ACCOUNT_PERFORMANCE_REPORT')
## End(Not run)



