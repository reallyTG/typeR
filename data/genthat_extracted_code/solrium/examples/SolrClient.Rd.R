library(solrium)


### Name: SolrClient
### Title: Solr connection client
### Aliases: SolrClient
### Keywords: datasets

### ** Examples

## Not run: 
##D # make a client
##D (cli <- SolrClient$new())
##D 
##D # variables
##D cli$host
##D cli$port
##D cli$path
##D cli$scheme
##D 
##D # ping
##D ## ping to make sure it's up
##D cli$ping("gettingstarted")
##D 
##D # version
##D ## get Solr version information
##D cli$schema("gettingstarted")
##D cli$schema("gettingstarted", "fields")
##D cli$schema("gettingstarted", "name")
##D cli$schema("gettingstarted", "version")$version
##D 
##D # Search
##D cli$search("gettingstarted", params = list(q = "*:*"))
##D cli$search("gettingstarted", body = list(query = "*:*"))
##D 
##D # set a different host
##D SolrClient$new(host = 'stuff.com')
##D 
##D # set a different port
##D SolrClient$new(host = 3456)
##D 
##D # set a different http scheme
##D SolrClient$new(scheme = 'https')
##D 
##D # set a proxy
##D SolrClient$new(proxy = list(url = "187.62.207.130:3128"))
##D 
##D prox <- list(url = "187.62.207.130:3128", user = "foo", pwd = "bar")
##D cli <- SolrClient$new(proxy = prox)
##D cli$proxy
##D 
##D # A remote Solr instance to which you don't have admin access
##D (cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D cli$search(params = list(q = "memory"))
## End(Not run)



