library(reutils)


### Name: linkset
### Title: linkset
### Aliases: linkset linkset,elink-method linkset,entrez_linkset-method

### ** Examples

## Not run: 
##D ## Find related articles to PMID 20210808 and xtract linked UIDs from the
##D ## "pubmed" to "pubmed_reviews" link
##D x <- elink("20210808", dbFrom = "pubmed", dbTo = "pubmed", cmd = "neighbor_score")
##D linkset(x, "pubmed_pubmed_reviews")
## End(Not run)



