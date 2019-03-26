library(MTurkR)


### Name: DisposeHIT
### Title: Dispose HIT
### Aliases: DisposeHIT disposehit
### Keywords: HITs

### ** Examples

## Not run: 
##D # Dispose a single HIT
##D b <- GenerateExternalQuestion("http://www.example.com/","400")
##D hit1 <- 
##D CreateHIT(hit.type = "2FFNCWYB49F9BBJWA4SJUNST5OFSOW", 
##D           expiration = seconds(days = 1),
##D           question=b$string)
##D ExpireHIT(hit1$HITId) # must be expired before disposing
##D DiposeHIT(hit1$HITId)
##D 
##D # Dispose all HITs of a given HITType
##D DisposeHIT(hit.type = hit1$HITTypeId)
##D 
##D # Dispose all HITs of a given batch from the RUI
##D DisposeHIT(annotation="BatchId:78382;")
## End(Not run)



