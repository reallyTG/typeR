library(EventStudy)


### Name: EventStudyAPI
### Title: API for <URL: www.eventstudytools.com>
### Aliases: EventStudyAPI
### Keywords: datasets

### ** Examples

## Not run: 
##D apiKey <- "{Please insert your aPI key here}"
##D 
##D The URL is already set by default
##D options(EventStudy.KEY = apiKey)
##D 
##D # initialize object
##D estSetup <- EventStudyAPI$new()
##D 
##D # get S&P500 example data
##D getSP500ExampleFiles()
##D 
##D # set Event Study parameters
##D estType <- "arc"
##D dataFiles <- c("request_file" = "01_RequestFile.csv", 
##D                "firm_data"    = "02_firmData.csv", 
##D                "market_data"  = "03_MarketData.csv")
##D resultPath <- "results"
##D 
##D # Perform Event Study 
##D estResult <- estSetup$performDefaultEventStudy(estType    = estType,
##D                                                dataFiles  = dataFiles, 
##D                                                destDir    = resultPath)
## End(Not run)




