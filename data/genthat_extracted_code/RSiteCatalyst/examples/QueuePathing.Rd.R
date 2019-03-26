library(RSiteCatalyst)


### Name: QueuePathing
### Title: Run a Pathing report
### Aliases: QueuePathing

### ** Examples

## Not run: 
##D pathpattern <- c("Home Page","::anything::","::anything::","::anything::")
##D queue_pathing_pages <- QueuePathing("your_report_suite",
##D                                     "2014-04-01",
##D                                     "2014-04-20",
##D                                     metric="pageviews",
##D                                     element="page",
##D                                     pathpattern
##D                                     )
##D enqueued.report.id <- QueuePathing("your_report_suite",
##D                                     "2014-04-01",
##D                                     "2014-04-20",
##D                                     metric="pageviews",
##D                                     element="page",
##D                                     pathpattern,
##D                                     enqueueOnly=TRUE
##D                                     )
## End(Not run)




