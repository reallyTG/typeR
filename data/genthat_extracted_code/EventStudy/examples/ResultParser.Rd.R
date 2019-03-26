library(EventStudy)


### Name: ResultParser
### Title: Parses request and results files returned from our Event Study
###   API interface.
### Aliases: ResultParser
### Keywords: datasets

### ** Examples

## Not run: 
##D # Assume you already performed an Event Study and result files are saved in 
##D # the actual working directory.
##D estParser <- ResultParser$new()
##D 
##D # parse request file
##D estParser$parseRequestFile("01_RequestFile.csv")
##D 
##D # parse result files
##D estParser$parseReport("Analysis report.csv")
##D estParser$parseAR("AR results.csv")
##D estParser$parseAAR("AAR results.csv")
## End(Not run)




