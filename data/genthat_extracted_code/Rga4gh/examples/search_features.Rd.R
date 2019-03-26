library(Rga4gh)


### Name: search_features
### Title: Search for Features
### Aliases: search_features

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Find a feature set to search in
##D feature_sets <- ref_client %>% search_feature_sets(d_id) %>% content()
##D fs_id <- feature_sets$featureSets[[1]]$id
##D 
##D ## Search the for features in the feature set
##D features <- ref_client %>% search_features(fs_id) %>% content()
##D features$features[[1]]
##D 
## End(Not run)




