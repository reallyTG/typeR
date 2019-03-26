library(RSiteCatalyst)


### Name: QueueDataWarehouse
### Title: Queue a DataWarehouse Report
### Aliases: QueueDataWarehouse

### ** Examples

## Not run: 
##D report.data <- QueueDataWarehouse("your_report_suite",
##D                             "2014-01-01",
##D                             "2014-01-07",
##D                             c("visits", "pageviews","event10"),
##D                             c("page","geoCountry","geoCity"),
##D                             enqueueOnly=TRUE,
##D                             ftp = list(host = "myftpserver.com",
##D                                        port = "21",
##D                                        directory = "/fromDW/",
##D                                        username = "memyselfandirene",
##D                                        password = "valkilmer",
##D                                        filename = "myreport.csv")
##D                             )
## End(Not run)



