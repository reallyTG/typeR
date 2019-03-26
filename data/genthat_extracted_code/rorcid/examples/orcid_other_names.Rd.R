library(rorcid)


### Name: orcid_other_names
### Title: Get education information for a person
### Aliases: orcid_other_names

### ** Examples

## Not run: 
##D # all data
##D res <- orcid_other_names(orcid = "0000-0001-7893-4389")
##D res$`0000-0001-7893-4389`
##D names(res$`0000-0001-7893-4389`)
##D res$`0000-0001-7893-4389`$`other-name`
##D 
##D # individual ones
##D orcid_other_names("0000-0001-7893-4389", 239534)
##D 
##D # formats
##D orcid_other_names("0000-0001-7893-4389", format = "application/xml")
## End(Not run)



