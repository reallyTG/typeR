library(rorcid)


### Name: orcid_keywords
### Title: Get education information for a person
### Aliases: orcid_keywords

### ** Examples

## Not run: 
##D # all data
##D res <- orcid_keywords(orcid = "0000-0002-1642-628X")
##D res$`0000-0002-1642-628X`
##D names(res$`0000-0002-1642-628X`)
##D res$`0000-0002-1642-628X`$`keyword`
##D 
##D # individual ones
##D orcid_keywords("0000-0002-1642-628X", 31202)
## End(Not run)



