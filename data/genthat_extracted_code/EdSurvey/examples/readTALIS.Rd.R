library(EdSurvey)


### Name: readTALIS
### Title: Connect to TALIS Data
### Aliases: readTALIS

### ** Examples

## Not run: 
##D # The following call returns an edsurvey.data.frame to TALIS 2013 
##D # for US teacher-level data at secondary level
##D usa2013 <- readTALIS(path = "C:/TALIS/2013", isced = "b",
##D                      dataLevel = "teacher", countries = "usa")
##D 
##D # Extract a data.frame with a few variables
##D gg <- getData(usa2013, c("tt2g05b", "tt2g01"))  
##D head(gg)
##D 
##D # Conduct a preliminary analysis on the edsurvey.data.frame
##D edsurveyTable(tt2g05b ~ tt2g01, data = usa2013) 
## End(Not run)



