library(Rga4gh)


### Name: search_expression_levels
### Title: Search for Expression Levels
### Aliases: search_expression_levels

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
##D ## Find an rna quantification to search in
##D rna_quantifications <- ref_client %>%
##D  search_rna_quantifications(rqs_id) %>% content()
##D rq_id <- rna_quantifications$rnaQuantifications[[1]]$id
##D 
##D ## Search for expression levels in the rna quantification
##D expression_levels <- ref_client %>%
##D  search_expression_levels(rq_id) %>% content()
##D expression_levels
##D 
## End(Not run)




