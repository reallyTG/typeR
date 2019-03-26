library(rcoreoa)


### Name: core_articles_pdf
### Title: Download article pdf
### Aliases: core_articles_pdf core_articles_pdf_

### ** Examples

## Not run: 
##D # just http request, get file path back
##D core_articles_pdf_(11549557)
##D 
##D # get paper and parse to text
##D core_articles_pdf(11549557)
##D 
##D ids <- c(11549557, 385071)
##D res <- core_articles_pdf(ids)
##D cat(res[[1]][1])
##D cat(res[[2]][1])
## End(Not run)



