library(dwapi)


### Name: dataset_create_request
### Title: Create request object for new datasets.
### Aliases: dataset_create_request

### ** Examples

request <- dwapi::dataset_create_request(title='datasetid', visibility = 'OPEN',
  description = 'description', tags = c('sdk') , license_string = 'Public Domain')
request <- dwapi::add_file(request = request, name = 'file.csv',
  url = 'http://data.world/file.csv')



