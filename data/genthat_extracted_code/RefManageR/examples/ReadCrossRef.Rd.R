library(RefManageR)


### Name: ReadCrossRef
### Title: Search CrossRef for citations.
### Aliases: ReadCrossRef
### Keywords: database

### ** Examples

if (interactive() && !httr::http_error("https://search.crossref.org/")){
  BibOptions(check.entries = FALSE)
  ## 3 results from the American Statistical Association involving "regression"
  ReadCrossRef("regression", filter = list(prefix="10.1198"), limit = 3)

  ## Some JRSS-B papers published in 2010 or later, note the quotes for filter
  ##   names with hypens
  ReadCrossRef(filter = list(issn = "1467-9868", "from-pub-date" = 2010),
               limit = 2, min.relevance = 0)

  ## Articles published by Institute of Mathematical Statistics
  ReadCrossRef(filter = list(prefix = "10.1214"), limit = 5, min.relevance = 0)

  ## old API
  ReadCrossRef(query = 'rj carroll measurement error', limit = 2, sort = "relevance",
    min.relevance = 80, use.old.api = TRUE)

  ReadCrossRef(query = 'carroll journal of the american statistical association',
    year = 2012, limit = 2, use.old.api = TRUE)
}



