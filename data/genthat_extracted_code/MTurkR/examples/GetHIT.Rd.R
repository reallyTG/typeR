library(MTurkR)


### Name: GetHIT
### Title: Get HIT
### Aliases: GetHIT gethit hit HITStatus status
### Keywords: HITs

### ** Examples

## Not run: 
##D # register HITType
##D hittype <- 
##D RegisterHITType(title="10 Question Survey",
##D                 description=
##D                 "Complete a 10-question survey about news coverage and your opinions",
##D                 reward=".20", 
##D                 duration=seconds(hours=1), 
##D                 keywords="survey, questionnaire, politics")
##D 
##D a <- GenerateExternalQuestion("http://www.example.com/","400")
##D hit1 <- 
##D CreateHIT(hit.type = hittype$HITTypeId, question = a$string)
##D 
##D GetHIT(hit1$HITId)
##D HITStatus(hit1$HITId)
##D 
##D # cleanup
##D DisableHIT(hit1$HITId)
## End(Not run)
## Not run: 
##D # Get the status of all HITs from a given batch from the RUI
##D HITStatus(annotation="BatchId:78382;")
## End(Not run)



