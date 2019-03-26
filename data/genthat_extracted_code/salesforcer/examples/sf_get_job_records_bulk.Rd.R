library(salesforcer)


### Name: sf_get_job_records_bulk
### Title: Returning the Details of a Bulk API Job
### Aliases: sf_get_job_records_bulk

### ** Examples

## Not run: 
##D job_info <- sf_create_job_bulk('insert', 'Account')
##D input_data <- tibble(Name=c("Test Account 1", "Test Account 2"))
##D batches_result <- sf_create_batches_bulk(job_info$id, input_data)
##D # pause a few seconds for operation to finish. Wait longer if job is not complete.
##D Sys.sleep(3)
##D # check status using - sf_get_job_bulk(job_info$id)
##D job_record_details <- sf_get_job_records_bulk(job_id=job_info$id)
## End(Not run)



