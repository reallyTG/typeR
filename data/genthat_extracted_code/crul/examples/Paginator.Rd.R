library(crul)


### Name: Paginator
### Title: Paginator client
### Aliases: Paginator
### Keywords: datasets

### ** Examples

## Not run: 
##D (cli <- HttpClient$new(url = "https://api.crossref.org"))
##D cc <- Paginator$new(client = cli, limit_param = "rows",
##D    offset_param = "offset", limit = 50, limit_chunk = 10)
##D cc
##D cc$get('works')
##D cc
##D cc$responses()
##D cc$status()
##D cc$status_code()
##D cc$times()
##D cc$content()
##D cc$parse()
##D lapply(cc$parse(), jsonlite::fromJSON)
##D 
##D # get full URLs for each request to be made
##D cc$url_fetch('works')
##D cc$url_fetch('works', query = list(query = "NSF"))
## End(Not run)



