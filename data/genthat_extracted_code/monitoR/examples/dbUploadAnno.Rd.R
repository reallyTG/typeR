library(monitoR)


### Name: dbUploadAnno
### Title: Upload Spectrogram Annotations to an Acoustics Database
### Aliases: dbUploadAnno
### Keywords: database utilities

### ** Examples

# Assumes 'MABI01_2010-05-22_054400_0_000.wav' is a survey in tblSurvey.fldSurveyName
# Assumes 'MABI01_2010-05-22_054400.csv' is a file of annotations belonging to the above survey

## Not run: 
##D #If using the 'acoustics' schema verbatim:
##D dbUploadAnno(
##D     annotations = "MABI01_2010-05-22_054400.csv", 
##D     survey = "MABI01_2010-05-22_054400_0_000.wav", 
##D     analyst = 1)
##D 
##D #'acoustics' schema, different database name:
##D dbUploadAnno(
##D     annotations = "MABI01_2010-05-22_054400.csv", 
##D     survey = "MABI01_2010-05-22_054400_0_000.wav", 
##D     db.name = "LocalSQLdb", 
##D     uid = "EntryOnly", 
##D     pwd = "07H23BBM", 
##D     analyst = 1)
## End(Not run)



