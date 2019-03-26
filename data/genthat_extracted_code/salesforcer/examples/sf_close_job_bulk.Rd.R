library(salesforcer)


### Name: sf_close_job_bulk
### Title: Close Bulk API Job
### Aliases: sf_close_job_bulk

### ** Examples

## Not run: 
##D my_query <- "SELECT Id, Name FROM Account LIMIT 10"
##D job_info <- sf_create_job_bulk(operation='query', object='Account')
##D query_info <- sf_submit_query_bulk(job_id=job_info$id, soql=my_query)
##D recordset <- sf_query_result_bulk(job_id = query_info$jobId,
##D                                   batch_id = query_info$id,
##D                                   result_id = result$result)
##D sf_close_job_bulk(job_info$id)
## End(Not run)



