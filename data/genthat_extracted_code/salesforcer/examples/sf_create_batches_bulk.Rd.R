library(salesforcer)


### Name: sf_create_batches_bulk
### Title: Add Batches to a Bulk API Job
### Aliases: sf_create_batches_bulk

### ** Examples

## Not run: 
##D # NOTE THAT YOU MUST FIRST CREATE AN EXTERNAL ID FIELD CALLED My_External_Id 
##D # BEFORE RUNNING THIS EXAMPLE
##D # inserting 2 records
##D my_data <- tibble(Name=c('New Record 1', 'New Record 2'),
##D                   My_External_Id__c=c('11111','22222'))
##D job_info <- sf_create_job_bulk(operation='insert',
##D                                object='Account')
##D batches_ind <- sf_create_batches_bulk(job_id = job_info$id,
##D                                       input_data = my_data)
##D # upserting 3 records
##D my_data2 <- tibble(My_External_Id__c=c('11111','22222', '99999'), 
##D                   Name=c('Updated_Name1', 'Updated_Name2', 'Upserted_Record')) 
##D job_info <- sf_create_job_bulk(operation='upsert',
##D                                externalIdFieldName='My_External_Id__c',
##D                                object='Account')
##D batches_ind <- sf_create_batches_bulk(job_id = job_info$id,
##D                                       input_data = my_data2)
##D sf_get_job_bulk(job_info$id)                                     
## End(Not run)



