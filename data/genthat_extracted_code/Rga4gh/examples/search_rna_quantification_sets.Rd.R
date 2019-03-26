library(Rga4gh)


### Name: search_rna_quantification_sets
### Title: Search for RNA Quantification Sets
### Aliases: search_rna_quantification_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Search for rna quantification sets in the dataset
##D rna_quantification_sets <- ref_client %>%
##D  search_rna_quantification_sets(d_id) %>% content()
##D rna_quantification_sets
##D 
## End(Not run)




