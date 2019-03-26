library(monitoR)


### Name: dbUploadSurvey
### Title: Upload Survey Metadata to an Acoustics Database
### Aliases: dbUploadSurvey
### Keywords: database utilities

### ** Examples

## Not run: 
##D # metadata for wav files:
##D metadata <- fileCopyRename(
##D         from = '~/media/SDcard', 
##D         to = '~/Desktop/Acoustics/Recordings', 
##D         csv.dir = '~/Desktop/Acoustics/Results', 
##D         loc.prefix = 'MABI01', 
##D         ext = 'wav', 
##D         CardRecorderID = 1, 
##D         kaleidoscope = FALSE)
##D         
##D # If using the 'acoustics' schema verbatim:
##D dbUploadSurvey(survey.meta = metadata)
##D 
##D # 'acoustics' schema, different database name:
##D dbUploadSurvey(
##D     survey.meta = metadata, 
##D     db.name = "LocalSQLdb", 
##D     uid = "EntryOnly", 
##D     pwd = "07H23BBM")
##D 
##D # metadata for wac files:
##D metadata <- fileCopyRename(
##D         from = '~/media/SDcard', 
##D         to = '~/Desktop/Acoustics/Recordings', 
##D         csv.dir = '~/Desktop/Acoustics/Results', 
##D         loc.prefix = 'MABI01', 
##D         ext = 'wac', 
##D         CardRecorderID = 1)
##D         
##D # If using the 'acoustics' schema verbatim:
##D dbUploadSurvey(survey.meta = metadata)
##D 
##D # 'acoustics' schema, different database name:
##D dbUploadSurvey(
##D     survey.meta = metadata, 
##D     db.name = "LocalSQLdb", 
##D     uid = "EntryOnly", 
##D     pwd = "07H23BBM")
##D 
##D # After converting wac files to wav files use update.query = TRUE:
##D new.metadata <- fileCopyRename(
##D         from = '~/Desktop/Acoustics/Recordings', 
##D         to = '~/Desktop/Acoustics/Surveys', 
##D         csv.dir = '~/Desktop/Acoustics/Results', 
##D         loc.prefix = 'MABI01', 
##D         ext = 'wav', 
##D         CardRecorderID = 1, 
##D         metadata.only = TRUE)
##D         
##D # If using the 'acoustics' schema verbatim:
##D dbUploadSurvey(survey.meta = new.metadata, update.query = TRUE)
##D 
##D # 'acoustics' schema, different database name:
##D dbUploadSurvey(
##D     survey.meta = new.metadata, 
##D     db.name = "LocalSQLdb", 
##D     uid = "EntryOnly", 
##D     pwd = "07H23BBM", 
##D     update.query = TRUE)
## End(Not run)



