library(rorcid)


### Name: orcid_works
### Title: Get works for a person
### Aliases: orcid_works

### ** Examples

## Not run: 
##D # get all works
##D res <- orcid_works(orcid = "0000-0002-9341-7985")
##D res$`0000-0002-9341-7985`
##D res$`0000-0002-9341-7985`$group
##D res$`0000-0002-9341-7985`$group$`work-summary`
##D res$`0000-0002-9341-7985`$group$`work-summary`[[1]]
##D str(res$`0000-0002-9341-7985`$group$`work-summary`[[1]])
##D 
##D # get individual works
##D orcid_works(orcid = "0000-0002-9341-7985", 5011717)
##D orcid_works(orcid = "0000-0002-9341-7985", put_code = c(5011717, 15536016))
##D 
##D # change formats
##D orcid_works("0000-0002-9341-7985", 5011717, "application/json")
##D orcid_works("0000-0002-9341-7985", 5011717, "application/xml")
##D orcid_works("0000-0002-9341-7985", 5011717, 
##D   "application/vnd.orcid+xml; qs=5")
##D orcid_works("0000-0002-9341-7985", 5011717, 
##D   "application/vnd.citationstyles.csl+json")
## End(Not run)



