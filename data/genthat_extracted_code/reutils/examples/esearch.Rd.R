library(reutils)


### Name: esearch
### Title: esearch - searching an Entrez database
### Aliases: esearch

### ** Examples

## Search PubMed for articles with the term "Chlamydia psittaci" in the
## title that were published in 2013.
pmid <- esearch("Chlamydia psittaci[titl] and 2013[pdat]", "pubmed")
pmid

## Not run: 
##D ## Extract the query results either as an XML tree or parsed into
##D ## a character vector
##D xml <- content(pmid, "xml")
##D uids <- uid(pmid)
##D 
##D ## Alternatively post the UIDs to the History Server.
##D pmid <- esearch("Chlamydia psittaci[titl] and 2013[pdat]", "pubmed",
##D                 usehistory = TRUE)
##D pmid
##D 
##D ## Associate new search results with the existing search results.
##D pmid2 <- esearch("Chlamydia psittaci[titl] and 2012[pdat]", "pubmed",
##D                  usehistory = TRUE, webenv = webenv(pmid))
##D pmid2
##D 
##D ## Sort results by author
##D pmid3 <- esearch("Chlamydia psittaci[titl] and 2013[pdat]", "pubmed",
##D                  sort = "first author")
##D pmid3
## End(Not run)



