library(RSiteCatalyst)


### Name: GetMetrics
### Title: Get Available Metrics within a Report Suite
### Aliases: GetMetrics

### ** Examples

## Not run: 
##D metrics.valid <- GetMetrics("your_report_suite",
##D                             metrics=c('visitors','pageviews'),
##D                             elements=c('page','geoCountry'),
##D                             date.granularity='day',
##D                             report.type=''))
##D 
##D metrics <- GetMetrics(report_suites$rsid)
## End(Not run)



