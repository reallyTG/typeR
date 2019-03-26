library(Rga4gh)


### Name: search_rna_quantifications
### Title: Search for RNA Quantifications
### Aliases: search_rna_quantifications

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Find an rna quantification set to search in
##D rna_quantification_sets <- ref_client %>%
##D  search_rna_quantification_sets(d_id) %>% content()
##D rqs_id <- rna_quantification_sets$rnaQuantificationSets[[1]]$id
##D 
##D ## Search for rna quantifications in the rna quantification set
##D rna_quantifications <- ref_client %>%
##D  search_rna_quantifications(rqs_id) %>% content()
##D rna_quantifications
## End(Not run)




