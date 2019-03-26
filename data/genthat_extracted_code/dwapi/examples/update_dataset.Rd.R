library(dwapi)


### Name: update_dataset
### Title: Update an existing dataset.
### Aliases: update_dataset

### ** Examples

request <- dwapi::dataset_update_request(visibility = 'OPEN',
  description = 'UPDATED DESCRIPTION !')

## Not run: 
##D   dwapi::update_dataset(dataset_update_req = request,
##D     dataset = 'user/dataset')
## End(Not run)



