library(rdfp)


### Name: dfp_getReportJobStatus
### Title: getReportJobStatus
### Aliases: dfp_getReportJobStatus

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
##D request_data <- list(reportJobId=dfp_runReportJob_result$id)
##D dfp_getReportJobStatus_result <- dfp_getReportJobStatus(request_data)
##D dfp_getReportJobStatus_result
##D 
##D # a simple while loop can keep checking a long running request until ready
##D counter <- 0
##D while(dfp_getReportJobStatus_result$V1 != 'COMPLETED' & counter < 10){
##D   dfp_getReportJobStatus_result <- dfp_getReportJobStatus(request_data)
##D   Sys.sleep(3)
##D   counter <- counter + 1
##D }
## End(Not run)



