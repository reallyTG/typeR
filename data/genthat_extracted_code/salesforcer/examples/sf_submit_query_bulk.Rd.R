library(salesforcer)


### Name: sf_submit_query_bulk
### Title: Submit Bulk Query Batch to a Bulk API Job
### Aliases: sf_submit_query_bulk

### ** Examples

## Not run: 
##D my_query <- "SELECT Id, Name FROM Account LIMIT 10"
##D job_info <- sf_create_job_bulk(operation='query', object='Account')
##D query_info <- sf_submit_query_bulk(job_id=job_info$id, soql=my_query)
## End(Not run)



