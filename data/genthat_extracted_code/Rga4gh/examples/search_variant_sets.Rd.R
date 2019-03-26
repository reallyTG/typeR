library(Rga4gh)


### Name: search_variant_sets
### Title: Search for Variant Sets
### Aliases: search_variant_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Search for variantsets in the dataset
##D variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
##D variant_sets
##D 
## End(Not run)




