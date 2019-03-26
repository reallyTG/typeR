library(fulltext)


### Name: scopus_search
### Title: Scopus search
### Aliases: scopus_search scopus_search_loop
### Keywords: internal

### ** Examples

## Not run: 
##D res <- scopus_search(query = "ecology")
##D res
##D 
##D #scopus_search(query = x, type = "abstract")
##D 
##D # looping through
##D res <- scopus_search_loop(query = "ecology community elk cow")
##D 
##D # using facets
##D ## scopus_search
##D res <- scopus_search(query = "ecology", facets = "subjarea(count=5)")
##D res
##D res$`search-results`$link
##D res$`search-results`$entry
##D res$`search-results`$facet
##D 
##D ## more examples
##D x <- scopus_search(query = "ecology", facets = "language(count=4)", count = 1)
##D x$`search-results`$facet
##D x <- scopus_search(query = "ecology", facets = "pubyear(count=3);doctype();language(count=4)")
##D x$`search-results`$facet
##D 
##D ## scopus_search_loop
##D res <- scopus_search_loop(query = "ecology", facets = "subjarea(count=5)", count = 200)
##D res$found
##D head(res$results)
##D res$facets
##D 
##D # sort
##D x <- scopus_search(query = "ecology", sort = "-title")
## End(Not run)



