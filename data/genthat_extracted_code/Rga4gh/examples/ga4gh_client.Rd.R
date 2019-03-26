library(Rga4gh)


### Name: ga4gh_client
### Title: GA4GH Client
### Aliases: ga4gh_client

### ** Examples

## Create a client for the reference server at http://1kgenomes.ga4gh.org
ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D ## Use this client as the first argument in the high-level API functions
##D 
##D ## Search for datasets in this server
##D library(magrittr)
##D datasets <- ref_client %>% search_datasets() %>% content()
##D 
##D ## or specify the api location in the search function
##D search_datasets("http://1kgenomes.ga4gh.org")
## End(Not run)




