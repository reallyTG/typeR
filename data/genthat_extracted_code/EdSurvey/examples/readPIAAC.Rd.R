library(EdSurvey)


### Name: readPIAAC
### Title: Connect to PIAAC Data
### Aliases: readPIAAC

### ** Examples

## Not run: 
##D # The following call returns an edsurvey.data.frame to PIAAC for Canada
##D can <- readPIAAC("C:/PIAAC", countries = "can")
##D 
##D # Extract a data.frame with a few variables
##D gg <- getData(can, c("c_d05","ageg10lfs"))  
##D head(gg)
##D 
##D # Conduct a preliminary analysis on the edsurvey.data.frame
##D edsurveyTable(~ c_d05 + ageg10lfs, data = can)
## End(Not run)




