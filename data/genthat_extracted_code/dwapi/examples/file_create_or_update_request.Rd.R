library(dwapi)


### Name: file_create_or_update_request
### Title: Create object for adding/updating a dataset file.
### Aliases: file_create_or_update_request

### ** Examples

file_create_or_update_req <- dwapi::file_create_or_update_request(
  file_name = "file.csv",
  url = "https://data.world/file.csv",
  description = "My updated CSV description",
  labels = list("raw data", "clean data"))



