library(Rga4gh)


### Name: search_phenotypes
### Title: Search for Phenotypes
### Aliases: search_phenotypes

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Find a phenotype association set to search in
##D phenotype_association_sets <- ref_client %>%
##D  search_phenotype_association_sets(d_id) %>% content()
##D pas_id <- phenotype_association_sets$phenotypeAssociationSets[[1]]$id
##D 
##D ## Search for pheotypes in the phenotype association set
##D phenotypes <- ref_client %>% search_phenotypes(pas_id) %>% content()
##D phenotypes$phenotypes[[1]]
##D 
## End(Not run)




