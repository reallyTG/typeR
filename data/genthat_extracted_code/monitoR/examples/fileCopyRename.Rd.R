library(monitoR)


### Name: fileCopyRename
### Title: Copy and Rename Sound Files from Portable Media
### Aliases: fileCopyRename
### Keywords: IO file

### ** Examples

## Not run: 
##D # Not run because it will create a file in user's working directory
##D data(survey)
##D 
##D writeWave(survey, "survey.wav")
##D 
##D meta <- fileCopyRename(
##D             files = "survey.wav", 
##D             to = getwd(), 
##D             csv.name = "sampleMeta.csv", 
##D             loc.prefix = "MABI06", 
##D             ext = "wav", 
##D             CardRecorderID = 1)
##D             
##D # If your recorder's clock is set to GMT but your OS is not:            
##D altmeta <- fileCopyRename(
##D                files = "survey.wav", 
##D                to = getwd(), 
##D                csv.name = "sampleMeta.csv", 
##D                loc.prefix = "MABI06", 
##D                ext = "wav", 
##D                rec.tz = "GMT", 
##D                CardRecorderID = 1)
##D             
##D file.remove("survey.wave")
## End(Not run)



