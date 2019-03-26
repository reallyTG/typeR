library(dwapi)


### Name: add_file
### Title: Add a file to a request object.
### Aliases: add_file add_file.default add_file.file_batch_update_request
###   add_file.dataset_create_request add_file.dataset_replace_request
###   add_file.dataset_update_request

### ** Examples

file_batch_update_req <- dwapi::file_batch_update_request()

file_batch_update_req <- dwapi::add_file(request = file_batch_update_req,
  name = 'file.csv', url = 'https://data.world/file3.csv')

dataset_create_req <- dwapi::dataset_create_request(title='coffeeCounty',
  visibility = 'OPEN', description = 'coffee county , AL - census income' ,
  tags = c('rsdk', 'sdk', 'arr') , license_string = 'Public Domain')

dataset_create_req <- dwapi::add_file(request = dataset_create_req,
  name = 'file4.csv', url = 'https://data.world/file4.csv')

dataset_replace_req <- dwapi::dataset_replace_request(visibility = 'OPEN',
  description = 'updated description', title = 'updated title', files = list())

dataset_replace_req <- dwapi::add_file(request = dataset_replace_req,
  name = 'file4.csv', url = 'https://data.world/file4.csv',
  description = "My 4th csv", labels = list("clean data"))



