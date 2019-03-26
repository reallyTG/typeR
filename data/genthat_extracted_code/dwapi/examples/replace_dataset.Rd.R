library(dwapi)


### Name: replace_dataset
### Title: Replace an existing dataset.
### Aliases: replace_dataset

### ** Examples

dataset_replace_req <- dwapi::dataset_replace_request(visibility = 'OPEN',
 description = 'UPDATED DESCRIPTION !', title = 'Updated Title')
## Not run: 
##D   dwapi::replace_dataset('user/dataset', dataset_replace_req)
## End(Not run)



