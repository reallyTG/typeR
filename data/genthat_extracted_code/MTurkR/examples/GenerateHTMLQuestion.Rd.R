library(MTurkR)


### Name: GenerateHTMLQuestion
### Title: Generate HTMLQuestion
### Aliases: GenerateHTMLQuestion
### Keywords: HITs

### ** Examples

## Not run: 
##D f <- system.file("templates/htmlquestion1.xml", package = "MTurkR")
##D a <- GenerateHTMLQuestion(file=f)
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



