library(salesforcer)


### Name: sf_create_job_bulk
### Title: Create Bulk API Job
### Aliases: sf_create_job_bulk

### ** Examples

## Not run: 
##D # insert into Account
##D job_info <- sf_create_job_bulk(operation='insert', object_name='Account')
##D 
##D # delete from Account
##D job_info <- sf_create_job_bulk(operation='delete', object_name='Account')
##D 
##D # update into Account
##D job_info <- sf_create_job_bulk(operation='update', object_name='Account')
##D 
##D # upsert into Account
##D job_info <- sf_create_job_bulk(operation='upsert',
##D                                externalIdFieldName='My_External_Id__c',
##D                                object_name='Account')
##D # insert attachments
##D job_info <- sf_create_job_bulk(operation='insert', object_name='Attachment')
##D 
##D # query leads
##D job_info <- sf_create_job_bulk(operation='query', object_name='Lead')
## End(Not run)



