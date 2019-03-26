library(rorcid)


### Name: orcid_employments
### Title: Get employment information for a person
### Aliases: orcid_employments

### ** Examples

## Not run: 
##D # all employment data
##D res <- orcid_employments(orcid = "0000-0002-1642-628X")
##D res$`0000-0002-1642-628X`
##D names(res$`0000-0002-1642-628X`)
##D res$`0000-0002-1642-628X`$`employment-summary`
##D 
##D # individual employment records
##D orcid_employments(orcid = "0000-0002-1642-628X", 1115445)
##D orcid_employments(orcid = "0000-0002-1642-628X", 148496)
##D 
##D # employment summary information
##D orcid_employments(orcid = "0000-0002-1642-628X", 1115445, summary = TRUE)
## End(Not run)



