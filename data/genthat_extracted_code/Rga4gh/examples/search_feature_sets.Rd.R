library(Rga4gh)


### Name: search_feature_sets
### Title: Search for Feature Sets
### Aliases: search_feature_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Search for feature sets in the dataset
##D feature_sets <- ref_client %>% search_feature_sets(d_id) %>% content()
##D feature_sets
##D 
## End(Not run)




