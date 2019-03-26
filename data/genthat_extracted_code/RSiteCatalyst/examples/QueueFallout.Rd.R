library(RSiteCatalyst)


### Name: QueueFallout
### Title: Run a Fallout Report
### Aliases: QueueFallout

### ** Examples

## Not run: 
##D 
##D falloutpattern <- c("Home Page","Contact Page","Login Page")
##D queue_fallout_pages <- QueueFallout("your_report_suite",
##D                                     "2014-04-01",
##D                                     "2014-04-20",
##D                                     metric="pageviews",
##D                                     element="page",
##D                                     falloutpattern
##D                                     )
##D queued_report_id <- QueueFallout("your_report_suite",
##D                                     "2014-04-01",
##D                                     "2014-04-20",
##D                                     metric="pageviews",
##D                                     element="page",
##D                                     falloutpattern,
##D                                     enqueueOnly=TRUE
##D                                     )
## End(Not run)




