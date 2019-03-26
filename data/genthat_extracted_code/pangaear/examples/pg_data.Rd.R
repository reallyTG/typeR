library(pangaear)


### Name: pg_cache_clear
### Title: Download data from Pangaea.
### Aliases: pg_cache_clear pg_cache_list pg_data

### ** Examples

## Not run: 
##D # a single file
##D (res <- pg_data(doi='10.1594/PANGAEA.807580'))
##D res[[1]]$doi
##D res[[1]]$citation
##D res[[1]]$data
##D 
##D # another single file
##D pg_data(doi='10.1594/PANGAEA.807584')
##D 
##D # Many files
##D (res <- pg_data(doi='10.1594/PANGAEA.761032'))
##D res[[1]]
##D res[[2]]
##D 
##D # Manipulating the cache
##D ## list files in the cache
##D pg_cache_list()
##D 
##D ## clear all data
##D # pg_cache_clear()
##D pg_cache_list()
##D 
##D ## clear a single dataset by DOI
##D pg_data(doi='10.1594/PANGAEA.812093')
##D pg_cache_list()
##D pg_cache_clear(doi='10.1594/PANGAEA.812093')
##D pg_cache_list()
##D 
##D ## clear more than 1 dataset by DOI
##D lapply(c('10.1594/PANGAEA.746398','10.1594/PANGAEA.746400'), pg_data)
##D pg_cache_list()
##D pg_cache_clear(doi=c('10.1594/PANGAEA.746398','10.1594/PANGAEA.746400'))
##D pg_cache_list()
##D 
##D # search for datasets, then pass in DOIs
##D (searchres <- pg_search(query = 'birds', count = 20))
##D pg_data(searchres$doi[1])
##D pg_data(searchres$doi[2])
##D pg_data(searchres$doi[3])
##D pg_data(searchres$doi[4])
##D pg_data(searchres$doi[7])
##D 
##D # png file
##D pg_data(doi = "10.1594/PANGAEA.825428")
##D 
##D # zip file
##D pg_data(doi = "10.1594/PANGAEA.860500")
##D 
##D # login required
##D ## we skip file download
##D pg_data("10.1594/PANGAEA.788547")
## End(Not run)



