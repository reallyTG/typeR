library(monitoR)


### Name: dbUploadTemplate
### Title: Upload Acoustic Templates to a Database
### Aliases: dbUploadTemplate
### Keywords: database utilities

### ** Examples

# Template construction
## Not run: 
##D data(btnw)
##D b4 <- makeBinTemplate(
##D     "btnw.wav", 
##D     frq.lim = c(2, 8), 
##D     select = "auto", 
##D     name = "b4", 
##D     buffer = 4, 
##D     amp.cutoff = -31, 
##D     binary = TRUE)
##D 
##D \dontrun{
##D #If using the 'acoustics' schema verbatim:
##D dbUploadTemplate(
##D     templates = b4, 
##D     analyst = 1, 
##D     locationID = "MABI01", 
##D     date.recorded = "2012/05/22", 
##D     recording.equip = "SM2", 
##D     species.code = "BTNW", 
##D     type = "BIN")
##D     
##D #'acoustics' schema, different database name:
##D dbUploadTemplate(
##D     templates = b4, 
##D     which.one = 1, 
##D     db.name = "LocalSQLdb", 
##D     uid = "EntryOnly", 
##D     pwd = "07H23BBM", 
##D     analyst = 1, 
##D     locationID = "MABI01", 
##D     date.recorded = "2012/05/22", 
##D     recording.equip = "SM2", 
##D     species.code = "BTNW", 
##D     type = "BIN")}
## End(Not run)



