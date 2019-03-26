library(RSiteCatalyst)


### Name: QueueRanked
### Title: Run a Ranked Report
### Aliases: QueueRanked

### ** Examples

## Not run: 
##D 
##D ranked1 <- QueueRanked("your_report_suite",
##D                        date.from = "2014-04-01",
##D                        date.to = "2014-04-20",
##D                        metrics = "pageviews",
##D                        elements = c("sitesection", "page")
##D                        )
##D                        
##D  ranked2 <- QueueRanked(
##D                        reportsuite.id = your_report_suite, 
##D                        date.from = "2016-03-30", 
##D                        date.to = "2016-03-30",
##D                        metrics = "orders",
##D                        elements = "product",
##D                        classification = "Product Group"
##D                        )
##D  enqueued.report.id <- QueueRanked(
##D                        reportsuite.id = your_report_suite, 
##D                        date.from = "2016-03-30", 
##D                        date.to = "2016-03-30",
##D                        metrics = "orders",
##D                        elements = "product",
##D                        classification = "Product Group",
##D                        enqueueOnly = TRUE
##D                        )
## End(Not run)




