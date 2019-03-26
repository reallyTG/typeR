library(Rga4gh)


### Name: search_variant_annotation_sets
### Title: Search for Variant Annotation Sets
### Aliases: search_variant_annotation_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Find a variant set to search in
##D variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
##D vs_id <- variant_sets$variantSets[[2]]$id
##D 
##D ## Search for variant annotation sets in the variant set
##D variant_annotation_sets <- ref_client %>%
##D  search_variant_annotation_sets(vs_id) %>% content()
##D variant_annotation_sets
## End(Not run)



