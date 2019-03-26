library(dwapi)


### Name: file_batch_update_request
### Title: Create request object for adding or updating dataset files.
### Aliases: file_batch_update_request

### ** Examples

request <- dwapi::file_batch_update_request()
request <- dwapi::add_file(
  request = request, name = 'file.csv', url = 'http://data.world/file.csv')



