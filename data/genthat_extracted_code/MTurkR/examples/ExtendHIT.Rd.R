library(MTurkR)


### Name: ExtendHIT
### Title: Extend HIT
### Aliases: ExtendHIT extend
### Keywords: HITs

### ** Examples

## Not run: 
##D a <- GenerateExternalQuestion("https://www.example.com/","400")
##D hit1 <- CreateHIT(title = "Example",
##D                   description = "Simple Example HIT",
##D                   reward = ".01",
##D                   expiration = seconds(days = 4),
##D                   duration = seconds(hours = 1),
##D                   keywords = "example",
##D                   question = a$string)
##D 
##D # add assignments
##D ExtendHIT(hit = hit1$HITId, add.assignments = "20")
##D 
##D # add time
##D ExtendHIT(hit = hit1$HITId, add.seconds = seconds(days=1)))
##D 
##D # add assignments and time
##D ExtendHIT(hit = hit1$HITId, add.assignments = "20", add.seconds = seconds(days=1)))
##D 
##D # cleanup
##D DisableHIT(hit = hit1$HITId)
##D 
## End(Not run)
## Not run: 
##D # Extend all HITs of a given batch from the RUI
##D ExtendHIT(annotation="BatchId:78382;", add.assignments = "20")
## End(Not run)



