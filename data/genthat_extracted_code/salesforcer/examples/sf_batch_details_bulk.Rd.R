library(salesforcer)


### Name: sf_batch_details_bulk
### Title: Returning the Details of a Batch in a Bulk API Job
### Aliases: sf_batch_details_bulk

### ** Examples

## Not run: 
##D job_info <- sf_create_job_bulk(operation = "query", object = "Account")
##D soql <- "SELECT Id, Name FROM Account LIMIT 10"
##D batch_query_info <- sf_submit_query_bulk(job_id = job_info$id, soql = soql)
##D batch_details <- sf_batch_details_bulk(job_id=batch_query_info$jobId,
##D                                        batch_id=batch_query_info$id)
##D sf_close_job_bulk(job_info$id)
## End(Not run)



