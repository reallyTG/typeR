library(RSiteCatalyst)


### Name: QueueOvertime
### Title: Run an Overtime Report
### Aliases: QueueOvertime

### ** Examples

## Not run: 
##D 
##D overtime1 <- QueueOvertime("your_report_suite",
##D                            date.from = "2014-04-01",
##D                            date.to = "2014-04-20",
##D                            metrics = c("pageviews", "visits", "bounces"),
##D                            date.granularity = "day")
##D 
##D overtime2 <- QueueOvertime("your_report_suite",
##D                            date.from = "2014-04-01",
##D                            date.to = "2014-04-20",
##D                            metrics = c("pageviews", "visits", "bounces"),
##D                            date.granularity = "day",
##D                            segment.id = "5433e4e6e4b02df70be4ac63",
##D                            anomaly.detection = TRUE,
##D                            interval.seconds = 10,
##D                            max.attempts = 20)
##D 
##D overtime3 <- QueueOvertime("your_report_suite",
##D                            date.from = "2014-04-01",
##D                            date.to = "2014-04-20",
##D                            metrics = c("pageviews", "visits", "bounces"),
##D                            date.granularity = "")
##D enqueued.report.id <- QueueOvertime("your_report_suite",
##D                            date.from = "2014-04-01",
##D                            date.to = "2014-04-20",
##D                            metrics = c("pageviews", "visits", "bounces"),
##D                            date.granularity = "",
##D                            enqueueOnly=TRUE)
## End(Not run)




