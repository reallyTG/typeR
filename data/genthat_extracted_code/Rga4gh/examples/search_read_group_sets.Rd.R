library(Rga4gh)


### Name: search_read_group_sets
### Title: Search for Read Group Sets
### Aliases: search_read_group_sets

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Search for read group sets in the dataset
##D read_group_sets <- ref_client %>% search_read_group_sets(d_id) %>% content()
##D read_group_sets
## End(Not run)



