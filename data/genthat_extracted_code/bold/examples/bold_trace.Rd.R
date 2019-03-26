library(bold)


### Name: bold_trace
### Title: Get BOLD trace files
### Aliases: bold_trace read_trace

### ** Examples

## Not run: 
##D # Use a specific destination directory
##D bold_trace(taxon='Bombus', geo='Alaska', dest="~/mytarfiles")
##D 
##D # Another example
##D # bold_trace(ids='ACRJP618-11', dest="~/mytarfiles")
##D # bold_trace(ids=c('ACRJP618-11','ACRJP619-11'), dest="~/mytarfiles")
##D 
##D # read file in
##D x <- bold_trace(ids=c('ACRJP618-11','ACRJP619-11'), dest="~/mytarfiles")
##D (res <- read_trace(x$ab1[2]))
##D 
##D # The progress dialog is pretty verbose, so quiet=TRUE is a nice touch,
##D # but not by default
##D # Beware, this one take a while
##D # x <- bold_trace(taxon='Osmia', quiet=TRUE)
##D 
##D if (requireNamespace("sangerseqR", quietly = TRUE)) {
##D  library("sangerseqR")
##D  primarySeq(res)
##D  secondarySeq(res)
##D  head(traceMatrix(res))
##D }
## End(Not run)



