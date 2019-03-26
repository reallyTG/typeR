library(Rga4gh)


### Name: search_variant_annotations
### Title: Search for Variant Annotations
### Aliases: search_variant_annotations

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
##D ## Find a variant annotation set to search in
##D variant_annotation_sets <- ref_client %>%
##D  search_variant_annotation_sets(vs_id) %>% content()
##D vas_id <- variant_annotation_sets$variantAnnotationSets[[1]]$id
##D 
##D ## Search for variant annotations in the variant annotation set
##D variant_annotations <- ref_client %>%
##D  search_variant_annotations(vas_id, reference_name = "1") %>% content
##D variant_annotations$variantAnnotations[[1]]
## End(Not run)




