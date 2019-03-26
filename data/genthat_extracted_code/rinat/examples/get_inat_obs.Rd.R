library(rinat)


### Name: get_inat_obs
### Title: Download inaturalist data
### Aliases: get_inat_obs

### ** Examples

## Not run: 
##D   ### Make a standard query
##D   get_inat_obs(query="Monarch Butterfly")
##D   
##D   ##Filter by a bounding box of Northern California
##D   bounds <- c(38.44047,-125,40.86652,-121.837)
##D   get_inat_obs(query="Mule Deer", bounds=bounds)
##D   
##D   ## Filter with by just taxon, allows higher order filtering, 
##D   ## Here we can search for just stone flies (order plecoptera)
##D   get_inat_obs(taxon_name="Plecoptera")
##D   
##D   ## get metadata (the number of results found on the server)
##D   out <- get_inat_obs(query="Monarch Butterfly", meta=TRUE)
##D   out$meta
## End(Not run)



