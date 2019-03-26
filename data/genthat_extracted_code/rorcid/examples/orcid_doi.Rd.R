library(rorcid)


### Name: orcid_doi
### Title: Search for ORCID ID's using DOIs
### Aliases: orcid_doi

### ** Examples

## Not run: 
##D orcid_doi(dois="10.1087/20120404", fuzzy=TRUE)
##D 
##D # fuzzy is FALSE by default
##D orcid_doi(dois="10.1087/20120404", fuzzy=FALSE)
##D 
##D # This DOI is not a real one, but a partial DOI, then we can fuzzy search
##D # get more than defualt 10 records (or rows)
##D orcid_doi(dois="10.1087/2", fuzzy=TRUE, rows=20) 
##D 
##D # If you don't input proper DOIs, the function will get mad
##D dois <- c("10.1371/journal.pone.0025995","10.1371/journal.pone.0053712",
##D        "10.1371/journal.pone.0054608","10.1371/journal.pone.0055937")
##D orcid_doi(dois=dois)
##D 
##D # dois <- c("10.1016/j.medpal.2008.12.005","10.1080/00933104.2000.10505926",
##D #          "10.1037/a0024480", "10.1002/anie.196603172","2344","asdf","232",
##D #          "asdf","23dd")
##D # orcid_doi(dois=dois)
##D 
##D orcid_doi(dois="10.1087/20120404", fuzzy=FALSE) 
##D orcid_doi(dois="10.1371/journal.pone.0025995", fuzzy=FALSE)
## End(Not run)



