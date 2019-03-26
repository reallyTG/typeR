library(markdown)


### Name: rpubsUpload
### Title: Upload an HTML file to RPubs
### Aliases: rpubsUpload

### ** Examples

## Not run: 
##D # upload a document
##D result <- rpubsUpload("My document title", "Document.html")
##D if (!is.null(result$continueUrl)) 
##D     browseURL(result$continueUrl) else stop(result$error)
##D 
##D # update the same document with a new title
##D updateResult <- rpubsUpload("My updated title", "Document.html", result$id)
## End(Not run)



