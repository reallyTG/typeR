library(RForcecom)


### Name: rforcecom.createBulkJob
### Title: Create Bulk API Job
### Aliases: rforcecom.createBulkJob

### ** Examples

## Not run: 
##D # insert into Account
##D job_info <- rforcecom.createBulkJob(session, operation='update', object='Account')
##D 
##D # delete from Account
##D job_info <- rforcecom.createBulkJob(session, operation='delete', object='Account')
##D 
##D # update into Account
##D job_info <- rforcecom.createBulkJob(session, operation='update', object='Account')
##D 
##D # upsert into Account
##D job_info <- rforcecom.createBulkJob(session, operation='upsert',
##D                                     externalIdFieldName='My_External_Id__c',
##D                                     object='Account')
##D 
##D # insert attachments
##D job_info <- rforcecom.createBulkJob(session, operation='insert', object='Attachment')
## End(Not run)



