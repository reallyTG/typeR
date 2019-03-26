library(bigrquery)


### Name: insert_upload_job
### Title: Create a new upload job deprecated
### Aliases: insert_upload_job
### Keywords: internal

### ** Examples

## Not run: 
##D list_datasets(bq_test_project)
##D list_tables("193487687779", "houston")
##D job <- insert_upload_job("193487687779", "houston", "mtcars", mtcars)
##D wait_for(job)
##D list_tables("193487687779", "houston")
##D delete_table("193487687779", "houston", "mtcars")
## End(Not run)



