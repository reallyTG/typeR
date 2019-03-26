library(diezeit)


### Name: zeit_search
### Title: Search the ZEIT archive
### Aliases: zeit_search

### ** Examples

## Not run: 
##D # simple content search
##D zeit_search(endpoint="content", query="bayreuth")
##D zeit_search("content", "bayreuth") # same same
##D 
##D # multiple tokens
##D zeit_search("content", c("bayreuth", "festspiele"))
##D 
##D # entire string
##D zeit_search("content", "bayreuther festspiele")
##D 
##D # field query
##D zeit_search("content", "title:bayreuth")
##D 
##D # partial selection
##D zeit_search("content", "bayreuth", fields=c("title", "teaser_text"))
##D 
##D # pagination
##D zeit_search("content", "bayreuth", limit=1) # just one match
##D zeit_search("content", "bayreuth", limit=1, offset=1) # just the second match
##D 
##D # sorting
##D zeit_search("content", "bayreuth",
##D   sort=c("release_date", "asc")) # sort by date
##D zeit_search("content", "bayreuth",
##D   sort=list(c("release_date", "desc"), c("title", "asc"))) # sort by date and title
##D 
##D # hide matches
##D bt.matches <- zeit_search("content", "bayreuth", print=FALSE)
##D 
##D # author search
##D zeit_search(endpoint="author", query="Stefan Locke")
## End(Not run)



