library(diezeit)


### Name: zeit_get
### Title: Get detailled content from the ZEIT archive
### Aliases: zeit_get

### ** Examples

## Not run: 
##D # get article metadata by ID
##D zeit_get("content", "3Ed7KYJOO2MXu5SQtnudQA")
##D 
##D # partial selection of output fields
##D zeit_get("content", "3Ed7KYJOO2MXu5SQtnudQA",
##D   fields=c("title", "release_date", "href"))
##D 
##D # hide result
##D article.meta <- zeit_get("content", "3Ed7KYJOO2MXu5SQtnudQA", print=FALSE)
## End(Not run)



