library(RSiteCatalyst)


### Name: BuildRealTimeReportStructure
### Title: Build Configuration for Real-Time Report
### Aliases: BuildRealTimeReportStructure
### Keywords: BuildRealTimeReportStructure

### ** Examples


## Not run: 
##D 
##D report.test1 <- BuildRealTimeReportStructure(report.name="test123",
##D                metric="instances",
##D                elements = c("prop2", "searchenginekeyword", "geocountry"))
##D 
##D report.test2 <- BuildRealTimeReportStructure(report.name="test456",
##D                metric="instances",
##D                elements = c("prop2", "searchenginekeyword", "geocountry"),
##D                min.granularity = "5")
##D 
##D report.test3 <- BuildRealTimeReportStructure(report.name="test789",
##D                metric="instances",
##D                elements = c("prop2", "searchenginekeyword", "geocountry"),
##D                min.granularity = "5",
##D                ui.report=FALSE)
##D    
## End(Not run)




