library(MTurkR)


### Name: DisableHIT
### Title: Disable HIT
### Aliases: DisableHIT disable
### Keywords: HITs

### ** Examples

## Not run: 
##D # Disable a single HIT
##D b <- GenerateExternalQuestion("http://www.example.com/","400")
##D hit1 <- CreateHIT(hit.type="2FFNCWYB49F9BBJWA4SJUNST5OFSOW", 
##D                   expiration = seconds(days = 1),
##D                   question=b$string)
##D DisableHIT(hit = hit1$HITId)
##D 
##D # Disable all HITs of a given HITType
##D DisableHIT(hit.type = hit1$HITTypeId)
##D 
##D # Disable all HITs of a given batch from the RUI
##D DisableHIT(annotation="BatchId:78382;")
## End(Not run)



