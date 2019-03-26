library(RForcecom)


### Name: rforcecom.createBulkBatch
### Title: Create and Add Batches to a Bulk API Job
### Aliases: rforcecom.createBulkBatch

### ** Examples

## Not run: 
##D 
##D # inserting 2 records
##D my_data <- data.frame(Name=c('New Record 1', 'New Record 2'), 
##D                       My_External_Id__c=c('11111','22222'), 
##D                       stringsAsFactors=FALSE)
##D batches_info <- rforcecom.createBulkBatch(session, 
##D                                           jobId=job_info$id, 
##D                                           data=my_data, 
##D                                           multiBatch=TRUE, 
##D                                           batchSize=50)
##D #upserting 3 records
##D my_data <- data.frame(My_External_Id__c=c('11111','22222', '99999'), 
##D                       Name=c('Updated_Name1', 'Updated_Name2', 'Upserted_Record'), 
##D                       stringsAsFactors=FALSE)
##D batches_info <- rforcecom.createBulkBatch(session, 
##D                                           jobId=job_info$id, 
##D                                           data=my_data, 
##D                                           multiBatch=TRUE, 
##D                                           batchSize=50)
## End(Not run)



