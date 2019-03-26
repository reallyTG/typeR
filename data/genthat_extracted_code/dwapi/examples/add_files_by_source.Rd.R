library(dwapi)


### Name: add_files_by_source
### Title: Add one or more files to a dataset.
### Aliases: add_files_by_source

### ** Examples

request <- dwapi::file_batch_update_request()
request <- dwapi::add_file(request = request, name = 'file.csv',
     url = 'https://data.world/some_file.csv')
## Not run: 
##D   dwapi::add_files_by_source(dataset = 'user/dataset',
##D      file_batch_update_req = request)
## End(Not run)



