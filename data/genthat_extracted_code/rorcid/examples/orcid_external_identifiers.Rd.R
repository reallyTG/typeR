library(rorcid)


### Name: orcid_external_identifiers
### Title: Get education information for a person
### Aliases: orcid_external_identifiers

### ** Examples

## Not run: 
##D # all data
##D res <- orcid_external_identifiers(orcid = "0000-0002-1642-628X")
##D res$`0000-0002-1642-628X`
##D names(res$`0000-0002-1642-628X`)
##D res$`0000-0002-1642-628X`$`external-identifier`
##D 
##D # individual records
##D orcid_external_identifiers(orcid = "0000-0002-1642-628X", 141736)
## End(Not run)



