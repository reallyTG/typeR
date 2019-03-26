library(Rga4gh)


### Name: search_individuals
### Title: Search for Individuals
### Aliases: search_individuals

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Search for individuals in the dataset
##D individuals <- ref_client %>% search_individuals(d_id) %>% content()
##D individuals
##D 
## End(Not run)




