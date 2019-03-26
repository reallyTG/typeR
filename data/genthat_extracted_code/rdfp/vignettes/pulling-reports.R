## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----load-package, eval=FALSE--------------------------------------------
#  library(rdfp)
#  options(rdfp.network_code = 123456789)
#  dfp_auth()

## ----auth, include = FALSE-----------------------------------------------
library(here)
library(rdfp)
token_path <- here::here("tests", "testthat", "rdfp_token.rds")
suppressMessages(dfp_auth(token = token_path, verbose = FALSE))
options_path <- here::here("tests", "testthat", "rdfp_options.rds")
rdfp_options <- readRDS(options_path)
options(rdfp.network_code = rdfp_options$network_code)

## ----advertiser-report---------------------------------------------------
request_data <- list(reportJob =
                        list(reportQuery =
                               list(dimensions = 'MONTH_AND_YEAR',
                                    dimensions = 'AD_UNIT_ID',
                                    dimensions = 'AD_UNIT_NAME',
                                    dimensions = 'ADVERTISER_NAME',
                                    dimensions = 'ORDER_NAME',
                                    dimensions = 'LINE_ITEM_NAME',
                                    adUnitView = 'FLAT',
                                    columns = 'AD_SERVER_IMPRESSIONS', 
                                    columns = 'AD_SERVER_CLICKS',
                                    dateRangeType = 'LAST_WEEK')
                             )
                      )
report_data <- dfp_full_report_wrapper(request_data)
report_data[,c('Dimension.MONTH_AND_YEAR', 'Dimension.AD_UNIT_ID', 'Column.AD_SERVER_CLICKS')]

## ----reusing-saved-queries-----------------------------------------------
# look for a particular saved query
request_data <- list(filterStatement=list(query="WHERE id = 936165016"))
this_result <- dfp_getSavedQueriesByStatement(request_data, as_df=FALSE)
this_report_query <- this_result[[1]]$reportQuery

# resubmit the report job with the saved query
report_data <- list(reportJob=list(reportQuery = this_report_query))
report_data <- dfp_full_report_wrapper(report_data)
report_data[,c('Dimension.AD_UNIT_ID', 'Column.AD_SERVER_CLICKS')]

## ----pulling-report-long-------------------------------------------------
# In order to run a report you must specify how the report should be structured 
# by specifying a reportQuery inside a reportJob. All of the dimensions, columns, 
# date range options, etc. are documented at:
# https://developers.google.com/ad-manager/api/reference/v201811/ReportService.ReportQuery
request_data <- list(reportJob=list(reportQuery=list(dimensions='MONTH_AND_YEAR', 
                                                     dimensions='AD_UNIT_ID',
                                                     adUnitView='FLAT',
                                                     columns='AD_SERVER_CLICKS', 
                                                     dateRangeType='LAST_WEEK'
                                                     )))

# the result is a list and most importantly the ID is included for checking its status
dfp_runReportJob_result <- dfp_runReportJob(request_data)
dfp_runReportJob_result$id

# to check the status repeatedly you just need to provide the id
# dfp_getReportJobStatus_result returns a character string of the reportJob status
request_data <- list(reportJobId=dfp_runReportJob_result$id)
dfp_getReportJobStatus_result <- dfp_getReportJobStatus(request_data)
dfp_getReportJobStatus_result

# a simple while loop can keep checking a long running request until ready
counter <- 0
while(dfp_getReportJobStatus_result$V1 != 'COMPLETED' & counter < 10){
  dfp_getReportJobStatus_result <- dfp_getReportJobStatus(request_data)
  Sys.sleep(3)
  counter <- counter + 1
}

# once the status is "COMPLETED" the data download URL can be retrieved
request_data <- list(reportJobId=dfp_runReportJob_result$id, exportFormat='CSV_DUMP')
dfp_getReportDownloadURL_result <- dfp_getReportDownloadURL(request_data)

# this function has been provided to download the data from URL and convert to a tbl_df
# supported exportFormats are currently c('CSV_DUMP', 'TSV', 'TSV_EXCEL')
report_data <- dfp_report_url_to_dataframe(report_url=dfp_getReportDownloadURL_result$V1, 
                                           exportFormat='CSV_DUMP')
report_data[,c('Dimension.MONTH_AND_YEAR', 'Dimension.AD_UNIT_ID', 'Column.AD_SERVER_CLICKS')]

