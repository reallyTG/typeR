library(MTurkR)


### Name: GenerateExternalQuestion
### Title: Generate ExternalQuestion
### Aliases: GenerateExternalQuestion
### Keywords: HITs

### ** Examples

## Not run: 
##D a <- GenerateExternalQuestion(url="http://www.example.com/", frame.height="400")
##D 
##D hit1 <- 
##D CreateHIT(title = "Survey",
##D           description = "5 question survey",
##D           reward = ".10",
##D           expiration = seconds(days = 4),
##D           duration = seconds(hours = 1),
##D           keywords = "survey, questionnaire",
##D           question = a$string)
##D 
##D ExpireHIT(hit1$HITId)
##D DisposeHIT(hit1$HITId)
## End(Not run)



