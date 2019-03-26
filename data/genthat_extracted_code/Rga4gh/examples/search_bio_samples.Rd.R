library(Rga4gh)


### Name: search_bio_samples
### Title: Search for Bio Samples
### Aliases: search_bio_samples

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D library(magrittr)
##D ## Find a dataset to search in
##D datasets <- ref_client %>% search_datasets() %>% content()
##D d_id <- datasets$datasets[[1]]$id
##D 
##D ## Search for bio samples in the dataset
##D bio_samples <- ref_client %>% search_bio_samples(d_id) %>% content()
##D bio_samples
##D 
## End(Not run)




