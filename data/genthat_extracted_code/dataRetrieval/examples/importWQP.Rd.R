library(dataRetrieval)


### Name: importWQP
### Title: Basic Water Quality Portal Data parser
### Aliases: importWQP

### ** Examples

# These examples require an internet connection to run

## Examples take longer than 5 seconds:
## Not run: 
##D rawSampleURL <- constructWQPURL('USGS-01594440','01075', '', '')
##D 
##D rawSample <- importWQP(rawSampleURL)
##D 
##D rawSampleURL_Zip <- constructWQPURL('USGS-01594440','01075', '', '', TRUE)
##D rawSample2 <- importWQP(rawSampleURL_Zip, zip=TRUE)
##D 
##D STORETex <- constructWQPURL('WIDNR_WQX-10032762','Specific conductance', '', '')
##D STORETdata <- importWQP(STORETex)
## End(Not run)



