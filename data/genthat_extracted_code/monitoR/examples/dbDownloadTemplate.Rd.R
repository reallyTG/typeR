library(monitoR)


### Name: dbDownloadTemplate
### Title: Retrieve templates from an acoustics database
### Aliases: dbDownloadTemplate
### Keywords: database utilities

### ** Examples

## Not run: 
##D #If using the 'acoustics' schema verbatim:
##D btnw <- dbDownloadTemplate(
##D         type = "BIN", 
##D         names= c("template1", "template2")
##D         FFTwl = 512, 
##D         FFTovlp = 0, 
##D         FFTwn = "hanning")
##D         
##D #'acoustics' schema, different database name:
##D btnw <- dbDownloadTemplate(
##D         db.name = "LocalSQLdb", 
##D         uid = "EntryOnly" , 
##D         pwd = "07H23BBM", 
##D         type = "COR", 
##D         species = c("BTNW", "OVEN") 
##D         FFTwl = 512, 
##D         FFTovlp = 0, 
##D         FFTwn = "hanning")
## End(Not run)



