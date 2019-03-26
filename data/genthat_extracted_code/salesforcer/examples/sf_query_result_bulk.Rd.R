library(salesforcer)


### Name: sf_query_result_bulk
### Title: Retrieving the Results of a Bulk Query Batch in a Bulk API Job
### Aliases: sf_query_result_bulk

### ** Examples

## Not run: 
##D my_query <- "SELECT Id, Name FROM Account LIMIT 10"
##D job_info <- sf_create_job_bulk(operation='query', object='Account')
##D query_info <- sf_submit_query_bulk(job_id=job_info$id, soql=my_query)
##D result <- sf_batch_details_bulk(job_id = query_info$jobId,
##D                                 batch_id = query_info$id)
##D recordset <- sf_query_result_bulk(job_id = query_info$jobId,
##D                                   batch_id = query_info$id,
##D                                   result_id = result$result)
##D sf_close_job_bulk(job_info$id)
## End(Not run)



