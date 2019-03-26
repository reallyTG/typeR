library(MTurkR)


### Name: SetHITAsReviewing
### Title: Set HIT as "Reviewing"
### Aliases: SetHITAsReviewing reviewing
### Keywords: HITs

### ** Examples

## Not run: 
##D a <- GenerateExternalQuestion("http://www.example.com/","400")
##D hit1 <- 
##D CreateHIT(hit.type="2FFNCWYB49F9BBJWA4SJUNST5OFSOW", question=a$string)
##D SetHITAsReviewing(hit1$HITId)
##D 
##D # cleanup
##D DisableHIT(hit1$HITId)
## End(Not run)



