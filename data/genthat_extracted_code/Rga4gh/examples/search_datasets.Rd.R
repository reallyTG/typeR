library(Rga4gh)


### Name: search_datasets
### Title: Search for Datasets
### Aliases: search_datasets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D ## Use the client to search for datasets
##D library(magrittr)
##D datasets <- ref_client %>% search_datasets() %>% content()
##D datasets
##D 
##D ## Or specify the API location within search_datasets
##D search_datasets("http://1kgenomes.ga4gh.org")
##D 
##D 
## End(Not run)




