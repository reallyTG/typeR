library(rorcid)


### Name: orcid_peer_reviews
### Title: Get peer review information for a person
### Aliases: orcid_peer_reviews

### ** Examples

## Not run: 
##D # all peer review data
##D res <- orcid_peer_reviews(orcid = "0000-0002-1642-628X")
##D res$`0000-0002-1642-628X`
##D names(res$`0000-0002-1642-628X`)
##D res$`0000-0002-1642-628X`$`group`
##D 
##D # get individual works
##D orcid_peer_reviews("0000-0003-1444-9135", 75565)
##D 
##D # summary
##D orcid_peer_reviews("0000-0003-1444-9135", 75565, summary = TRUE)
## End(Not run)



