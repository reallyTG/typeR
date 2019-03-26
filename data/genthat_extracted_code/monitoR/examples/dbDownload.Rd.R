library(monitoR)


### Name: dbDownload
### Title: Retrieve Card-Recorder ID Values or Survey Names from a Database
### Aliases: dbDownloadCardRecorderID dbDownloadSurvey
### Keywords: database utilities

### ** Examples

## Not run: 
##D #If using the 'acoustics' schema verbatim:
##D CRs <- dbDownloadCardRecorderID(
##D         date.deployed = "2012/05/22", 
##D         date.collected = "2012/05/29", 
##D         loc.prefix = "MABI01")
##D         
##D surveys <- dbDownloadSurvey(
##D         start.date = "2012/05/22", 
##D         end.date = "2012/05/29", 
##D         loc.prefix = "MABI01", 
##D         samp.rate = 24000, 
##D         ext = "wav")
##D         
##D #'acoustics' schema, different database name:
##D CRs <- dbDownloadCardRecorderID(
##D         db.name = "LocalSQLdb", 
##D         uid = "EntryOnly", 
##D         pwd = "07H23BBM", 
##D         date.deployed = "2012/05/22", 
##D         date.collected = "2012/05/29", 
##D         loc.prefix = "MABI01")
##D         
##D surveys <- dbDownloadSurvey(
##D         db.name = "LocalSQLdb", 
##D         uid = "EntryOnly", 
##D         pwd = "07H23BBM", 
##D         start.date = "2012/05/22", 
##D         end.date = "2012/05/29", 
##D         loc.prefix = "MABI01", 
##D         samp.rate = 24000, 
##D         ext = "wav")
## End(Not run)



