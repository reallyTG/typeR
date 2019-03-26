library(MTurkR)


### Name: ExpireHIT
### Title: Expire HIT
### Aliases: ExpireHIT expire
### Keywords: HITs

### ** Examples

## Not run: 
##D a <- GenerateExternalQuestion("http://www.example.com/","400")
##D hit1 <- 
##D CreateHIT(hit.type="2FFNCWYB49F9BBJWA4SJUNST5OFSOW", question = a$string)
##D 
##D # expire HIT
##D ExpireHIT(hit = hit1$HITId)
##D 
##D # Expire all HITs of a given batch from the RUI
##D ExpireHIT(annotation="BatchId:78382;")
## End(Not run)



