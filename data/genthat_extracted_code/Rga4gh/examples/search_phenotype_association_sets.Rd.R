library(Rga4gh)


### Name: search_phenotype_association_sets
### Title: Search for Phenotype Association Sets
### Aliases: search_phenotype_association_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Search for phenotype association sets in the dataset
##D phenotype_association_sets <- ref_client %>%
##D  search_phenotype_association_sets(d_id) %>% content()
##D phenotype_association_sets
##D 
## End(Not run)




