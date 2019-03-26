library(dwapi)


### Name: create_dataset
### Title: Create a new dataset.
### Aliases: create_dataset

### ** Examples

request <- dwapi::dataset_create_request(
  title='testdataset', visibility = 'OPEN',
  description = 'Test Dataset by R-SDK', tags = c('rsdk', 'sdk', 'arr'),
  license_string = 'Public Domain')

request <- dwapi::add_file(request = request, name = 'file4.csv',
  url = 'https://data.world/file4.csv')

## Not run: 
##D dwapi::create_dataset(create_dataset_req = request,
##D   owner_id = 'user')
## End(Not run)



