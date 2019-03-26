library(rorcid)


### Name: orcid_fundings
### Title: Get funding information for a person
### Aliases: orcid_fundings

### ** Examples

## Not run: 
##D # all funding data
##D res <- orcid_fundings(orcid = "0000-0002-1642-628X")
##D res$`0000-0002-1642-628X`
##D names(res$`0000-0002-1642-628X`)
##D res$`0000-0002-1642-628X`$`group`
##D 
##D # individual funding records
##D orcid_fundings(orcid = "0000-0002-1642-628X", 385627)
##D 
##D # funding summary information
##D orcid_fundings(orcid = "0000-0002-1642-628X", 385627, summary = TRUE)
## End(Not run)



