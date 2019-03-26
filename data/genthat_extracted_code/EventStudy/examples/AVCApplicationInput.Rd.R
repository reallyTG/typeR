library(EventStudy)


### Name: AVCApplicationInput
### Title: Abnormal Volume Calculation Parameters
### Aliases: AVCApplicationInput
### Keywords: datasets

### ** Examples

## Not run: 
##D # get files for our S&P500 example; 3 files are written in the current 
##D # working directory
##D getSP500ExampleFiles()
##D 
##D # Generate a new parameter object
##D avcParams <- AVCApplicationInput$new()
##D 
##D # set test statistics
##D arcParams$setBenchmarkModel("garch")
##D 
##D # Setup API object
##D apiKey <- "{Your API key}"
##D estSetup <- EventStudyAPI$new()
##D estSetup$authentication(apiKey)
##D 
##D # Perform Event Study
##D estSetup$performEventStudy(estParams = avcParams, 
##D                            dataFiles = c("request_file" = "01_RequestFile.csv",
##D                                          "firm_data"    = "02_firmData.csv",
##D                                          "market_data"  = "03_marketData.csv"))
##D 
##D # Download task results and save them in the actiual working directory
##D estSetup$getTaskResults()
## End(Not run)




