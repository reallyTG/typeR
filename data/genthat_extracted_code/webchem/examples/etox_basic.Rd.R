library(webchem)


### Name: etox_basic
### Title: Get basic information from a ETOX ID
### Aliases: etox_basic

### ** Examples

## Not run: 
##D id <- get_etoxid('Triclosan', match = 'best')
##D etox_basic(id$etoxid)
##D 
##D # Retrieve CAS for multiple inputs
##D ids <- c("20179", "9051")
##D out <- etox_basic(ids)
##D out
##D 
##D # extract ec numbers
##D sapply(out, function(y) y$ec)
## End(Not run)



