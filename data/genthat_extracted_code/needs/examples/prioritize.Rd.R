library(needs)


### Name: prioritize
### Title: Re-attach packages to prevent masking
### Aliases: prioritize

### ** Examples

## Not run: 
##D 
##D # loading plyr after dplyr causes badness
##D needs(dplyr, plyr)
##D 
##D # prioritize the functions in dplyr
##D prioritize(dplyr)
##D 
## End(Not run)




