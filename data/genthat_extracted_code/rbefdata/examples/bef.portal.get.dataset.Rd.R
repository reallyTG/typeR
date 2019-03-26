library(rbefdata)


### Name: bef.portal.get.dataset
### Title: Fetch primary data from a BEFdata portal dataset.
### Aliases: bef.get.dataset bef.get.dataset_by bef.portal.get.dataset
###   bef.portal.get.dataset_by

### ** Examples

## Not run: 
##D         datset1 = bef.portal.get.dataset(id=8)
##D         metadata1 = attributes(dataset1)
##D 
##D         curl = getCurlHandle()
##D         ids = c(8,70)
##D         dataset_list = lapply(ids, function(x) bef.portal.get.dataset_by(id = x, curl = curl))
##D         metadata = attributes(dataset_list[[1]])
##D       
## End(Not run)



