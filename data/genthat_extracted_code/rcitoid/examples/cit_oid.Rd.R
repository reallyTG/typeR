library(rcitoid)


### Name: cit_oid
### Title: Get Citoid data
### Aliases: cit_oid cit_oid_

### ** Examples

url<-"https://en.wikipedia.org/api/rest_v1/data/citation/mediawiki/30446726"
if (crul::ok(url)) {
  pmid1 <- 30446726
  cit_oid(pmid1)
}

## Not run: 
##D doi1 <- "10.1108/jd-12-2013-0166"
##D doi2 <- "10.1371/journal.pone.0058568"
##D pmid1 <- 30446726
##D pmcid1 <- "PMC4679344"
##D isbn1 <- 1439895619
##D 
##D # different formats
##D cit_oid(doi1)
##D cit_oid(pmid1, format = "mediawiki")
##D cit_oid(pmid1, format = "zotero")
##D cit_oid(pmid1, format = "mediawiki-basefields")
##D cat(cit_oid(pmid1, format = "bibtex")[[1]])
##D 
##D # PMID example
##D cit_oid(pmid1, verbose = TRUE)
##D 
##D # ISBN example
##D cit_oid(isbn1, verbose = TRUE)
##D 
##D # PMCID example
##D cit_oid(pmcid1)
##D 
##D # set the accept language
##D x <- cit_oid(pmid1, accept_language = "fr-FR", verbose = TRUE)
##D x <- cit_oid(doi2, accept_language = "de-DE", verbose = TRUE)
##D 
##D # just get raw text/json
##D cit_oid_(pmcid1)
##D 
##D # many ids at once
##D cit_oid(id = c(pmid1, pmcid1, isbn1))
##D cit_oid_(id = c(pmid1, pmcid1, isbn1))
##D cit_oid_(id = c(pmid1, pmcid1, isbn1), format = "bibtex")
## End(Not run)



