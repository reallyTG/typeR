library(reutils)


### Name: elink
### Title: elink - finding related data through Entrez links
### Aliases: elink

### ** Examples

## Find one set of Gene IDs linked to nuccore GIs 34577062 and 24475906
e <- elink(c("927442695", "312836839"), dbFrom = "nuccore", dbTo = "gene")
e

## Not run: 
##D ## Find related articles to PMID 20210808
##D p <- elink("20210808", dbFrom = "pubmed", dbTo = "pubmed")
##D p
##D 
##D ## Extract linked UIDs from the "pubmed" to "pubmed_reviews" link
##D linkset(p, "pubmed_pubmed_reviews")
##D 
##D ## or
##D p["pubmed_pubmed_reviews"]
##D 
##D ## retrive the abstracts for the first five linked reviews
##D abstracts <- efetch(p["pubmed_pubmed_reviews"][1:5], rettype = "abstract")
## End(Not run)



