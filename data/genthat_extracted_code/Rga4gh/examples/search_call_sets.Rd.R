library(Rga4gh)


### Name: search_call_sets
### Title: Search for Call Sets
### Aliases: search_call_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Find a variant set to search in
##D variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
##D vs_id <- variant_sets$variantSets[[1]]$id
##D 
##D ## Search for call sets in the variant set
##D call_sets <- ref_client %>% search_call_sets(vs_id) %>% content()
##D call_sets
##D 
## End(Not run)




