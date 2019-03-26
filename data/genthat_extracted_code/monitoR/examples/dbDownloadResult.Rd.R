library(monitoR)


### Name: dbDownloadResult
### Title: Create 'detectionList' Objects from Data Stored in a Database
### Aliases: dbDownloadResult
### Keywords: database utilities

### ** Examples

## Not run: 
##D #If using the 'acoustics' schema verbatim:
##D examp <- dbDownloadResult(
##D         survey = "INTV02_2011-06-25_081000_EDT.mp3", 
##D         templates = templates, type = "BIN")
##D         
##D #'acoustics' schema, different database name:
##D examp <- dbDownloadResult(
##D         db.name = "LocalSQLdb", 
##D         uid = "EntryOnly" , 
##D         pwd = "07H23BBM", 
##D         survey = "INTV02_2011-06-25_081000_EDT.mp3", 
##D         templates = templates, 
##D         type = "BIN")
## End(Not run)



