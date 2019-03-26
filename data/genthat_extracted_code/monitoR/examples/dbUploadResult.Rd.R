library(monitoR)


### Name: dbUploadResult
### Title: Upload Detection Results to an Acoustics Database
### Aliases: dbUploadResult
### Keywords: database utilities

### ** Examples

## Not run: 
##D ## Not run, as it requires a database to receive the upload
##D # Load data
##D data(btnw)
##D data(survey)
##D 
##D # Write Wave objects to file (temporary directory used here)
##D btnw.fp <- file.path(tempdir(), "btnw.wav")
##D survey.fp <- file.path(tempdir(), "survey2010-12-31_120000_EST.wav")
##D writeWave(btnw, btnw.fp)
##D writeWave(survey, survey.fp)
##D 
##D # Template construction
##D b4 <- makeBinTemplate(
##D     btnw.fp, 
##D     frq.lim = c(2, 8), 
##D     select = "auto", 
##D     name = "b4", 
##D     buffer = 4, 
##D     amp.cutoff = -31, 
##D     binary = TRUE)
##D 
##D # Binary point matching
##D scores <- binMatch(survey = survey.fp, templates = b4, time.source = 'fileinfo')
##D 
##D # Isolate peaks
##D pks <- findPeaks(scores)
##D 
##D #If using the 'acoustics' schema verbatim:
##D dbUploadResult(detection.obj = pks, analysis.type = "BIN", analyst = 1)
##D 
##D #'acoustics' schema, different database name:
##D dbUploadResult(
##D     detection.obj = pks, 
##D     which.one = "b4", 
##D     what = "peaks", 
##D     db.name = "LocalSQLdb", 
##D     uid = "EntryOnly" , 
##D     pwd = "07H23BBM", 
##D     analysis.type = "BIN", 
##D     analyst = 1)
## End(Not run)
    
    
    



