library(MTurkR)


### Name: GetFileUpload
### Title: Get Files Uploaded by Workers
### Aliases: GetFileUpload geturls
### Keywords: Assignments

### ** Examples

## Not run: 
##D a <- GenerateExternalQuestion("http://www.example.com/","400")
##D hit1 <- 
##D CreateHIT(title = "Upload a file",
##D           description = "Upload a file",
##D           reward = ".10",
##D           duration = seconds(days=1),
##D           keywords = "file, upload",
##D           question = a$string)
##D ExpireHIT(hit1$HITId)
##D a <- GetAssignments(hit = hit1$HITId)
##D f <- GetFileUpload(a, "dictation", download = TRUE)
##D 
##D # cleanup
##D DisposeHIT(hit1$HITId)
## End(Not run)



