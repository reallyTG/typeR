library(dwapi)


### Name: file_create_request
### Title: Create object for adding a dataset file.
### Aliases: file_create_request

### ** Examples

file_create_req <- dwapi::file_create_request(file_name = "file.csv",
  url = "https://data.world/file.csv",
  description = "My CSV file",
  labels = list("raw data"))



