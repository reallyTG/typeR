library(rdfp)


### Name: dfp_getReportDownloadURL
### Title: ReportService
### Aliases: dfp_getReportDownloadURL

### ** Examples

## Not run: 
##D request_data <- list(reportJob=
##D                        list(reportQuery=
##D                               list(dimensions='MONTH_AND_YEAR', 
##D                                    dimensions='AD_UNIT_ID',
##D                                    adUnitView='FLAT',
##D                                    columns='AD_SERVER_CLICKS', 
##D                                    dateRangeType='LAST_WEEK')))
##D 
##D # the result is a list and most importantly the ID is included for checking its status
##D dfp_runReportJob_result <- dfp_runReportJob(request_data)
##D 
##D # only run after the status is "COMPLETED"
##D request_data <- list(reportJobId=dfp_runReportJob_result$id, exportFormat='CSV_DUMP')
##D dfp_getReportDownloadURL_result <- dfp_getReportDownloadURL(request_data)
## End(Not run)



