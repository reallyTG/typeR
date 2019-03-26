library(rorcid)


### Name: orcid_researcher_urls
### Title: Get researcher urls for a person
### Aliases: orcid_researcher_urls

### ** Examples

## Not run: 
##D # all data
##D res <- orcid_researcher_urls(orcid = "0000-0003-1444-9135")
##D res$`0000-0003-1444-9135`
##D names(res$`0000-0003-1444-9135`)
##D res$`0000-0003-1444-9135`$`researcher-url`
##D 
##D # individual ones
##D orcid_researcher_urls("0000-0003-1444-9135", 304093)
##D orcid_researcher_urls("0000-0003-1444-9135", c(332241, 304093))
##D 
##D # formats
##D orcid_researcher_urls("0000-0003-1444-9135", 304093, 
##D   format = "application/xml")
## End(Not run)



