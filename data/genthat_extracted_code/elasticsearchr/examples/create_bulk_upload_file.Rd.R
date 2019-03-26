library(elasticsearchr)


### Name: create_bulk_upload_file
### Title: Create Bulk API data file.
### Aliases: create_bulk_upload_file create_bulk_delete_file

### ** Examples

## Not run: 
##D bulk_upload_info <- create_metadata("index", "iris", "data", n = nrow(iris))
##D create_bulk_upload_file(bulk_upload_info, iris)
##D # "/var/folders/__/yz_l30s48xj6m_0059b_2twr0000gn/T//RtmpQnvUOt/file98194322b8"
##D 
##D bulk_delete_info <- create_metadata("delete", "iris", "data", n = nrow(iris))
##D create_bulk_delete_file(bulk_delete_info)
##D # "/var/folders/__/yz_l30s48xj6m_0059b_2twr0000gn/T//RtmpQnvUOt/file98194322b8"
## End(Not run)



