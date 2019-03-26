library(MTurkR)


### Name: ChangeHITType
### Title: Change HITType Properties of a HIT
### Aliases: ChangeHITType changehittype
### Keywords: HITs

### ** Examples

## Not run: 
##D hittype1 <- 
##D RegisterHITType(title = "10 Question Survey",
##D                 description =
##D                   "Complete a 10-question survey about news coverage and your opinions",
##D                 reward = ".20", 
##D                 duration = seconds(hours=1), 
##D                 keywords = "survey, questionnaire, politics")
##D a <- GenerateExternalQuestion("http://www.example.com/", "400")
##D hit <- CreateHIT(hit.type = hittype1$HITTypeId, 
##D                  assignments = 1,
##D                  expiration = seconds(days=1),
##D                  question = a$string)
##D 
##D # change to HITType with new reward amount
##D hittype2 <- 
##D RegisterHITType(title = "10 Question Survey",
##D                 description =
##D                   "Complete a 10-question survey about news coverage and your opinions",
##D                 reward = ".45", 
##D                 duration = seconds(hours=1), 
##D                 keywords = "survey, questionnaire, politics")
##D ChangeHITType(hit = hit$HITId,
##D               new.hit.type=hittype2$HITTypeId)
##D 
##D # Change to new HITType, with arguments stated atomically
##D ChangeHITType(hit = hit$HITId,
##D               title = "10 Question Survey", 
##D               description =
##D                 "Complete a 10-question survey about news coverage and your opinions", 
##D               reward = ".20", 
##D               duration = seconds(hours=1), 
##D               keywords = "survey, questionnaire, politics")
##D 
##D # expire and dispose HIT
##D ExpireHIT(hit = hit$HITId)
##D DisposeHIT(hit = hit$HITId)
## End(Not run)



