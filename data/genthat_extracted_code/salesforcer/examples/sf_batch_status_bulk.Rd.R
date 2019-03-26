library(salesforcer)


### Name: sf_batch_status_bulk
### Title: Checking the Status of a Batch in a Bulk API Job
### Aliases: sf_batch_status_bulk

### ** Examples

## Not run: 
##D job_info <- sf_create_job_bulk(operation = "query", object = "Account")
##D soql <- "SELECT Id, Name FROM Account LIMIT 10"
##D batch_query_info <- sf_submit_query_bulk(job_id = job_info$id, soql = soql)
##D batch_status <- sf_batch_status_bulk(job_id=batch_query_info$jobId,
##D                                      batch_id=batch_query_info$id)
##D job_close_ind <- sf_close_job_bulk(job_info$id)
##D sf_get_job_bulk(job_info$id)                               
## End(Not run)



