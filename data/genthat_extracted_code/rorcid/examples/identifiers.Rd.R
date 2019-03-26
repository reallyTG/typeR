library(rorcid)


### Name: identifiers
### Title: Get identifiers
### Aliases: identifiers identifiers.works identifiers.list
###   identifiers.orcid_id identifiers.orcid identifiers.orcid_doi

### ** Examples

## Not run: 
##D # Result of call to works()
##D x <- works(orcid_id("0000-0001-8607-8025"))
##D # doi by default
##D identifiers(x)
##D # orcids
##D identifiers(x, "orcid")
##D # pmid
##D identifiers(x, "pmid")
##D # pmc 
##D identifiers(x, "pmc") 
##D # other_id
##D identifiers(x, "other_id")
##D 
##D # Result of call to orcid_id()
##D x <- orcid_id(orcid = "0000-0002-9341-7985")
##D identifiers(x, "doi")
##D identifiers(x, "eid")
##D 
##D # Result of call to orcid()
##D x <- orcid(query="carl+boettiger")
##D identifiers(x)
##D 
##D # Result of call to orcid_doi()
##D x <- orcid_doi(dois="10.1087/20120404", fuzzy=TRUE)
##D identifiers(x)
## End(Not run)



