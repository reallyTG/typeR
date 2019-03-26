library(rorcid)


### Name: orcid_educations
### Title: Get education information for a person
### Aliases: orcid_educations

### ** Examples

## Not run: 
##D # all education data
##D res <- orcid_educations(orcid = "0000-0002-1642-628X")
##D res$`0000-0002-1642-628X`
##D names(res$`0000-0002-1642-628X`)
##D res$`0000-0002-1642-628X`$`education-summary`
##D 
##D # individual education records
##D orcid_educations(orcid = "0000-0002-1642-628X", 148494)
##D 
##D # education summary information
##D orcid_educations(orcid = "0000-0002-1642-628X", 148494, summary = TRUE)
## End(Not run)



