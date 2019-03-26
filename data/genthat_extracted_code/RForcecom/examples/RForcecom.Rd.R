library(RForcecom)


### Name: RForcecom
### Title: RForcecom
### Aliases: RForcecom RForcecom-package
### Keywords: connection package

### ** Examples

## Not run: 
##D  # Sign in to the Force.com
##D  username <- "yourname@yourcompany.com"
##D  password <- "YourPasswordSECURITY_TOKEN"
##D  session <- rforcecom.login(username, password)
##D      
##D  # Execute a SOQL
##D  soqlQuery <- "SELECT Id, Name, Industry, AnnualRevenue FROM Account"
##D  rforcecom.query(session, soqlQuery)
##D  
##D  # Execute a SOSL
##D  queryString <- "United"
##D  rforcecom.search(session, queryString)
##D  
##D  # Create a record
##D  objectName <- "Account"
##D  fields <- c(Name="R Analytics Service Ltd", Phone="5555-5555-5555")
##D  rforcecom.create(session, objectName, fields)
##D      
##D  # Retrieve record
##D  objectName <- "Account"
##D  fields <- c("name", "Industry", "AnnualRevenue")
##D  rforcecom.retrieve(session, objectName, fields)
##D  
##D  # Update a record
##D  objectName <- "Account"
##D  id <- "999x000000xxxxxZZZ"
##D  fields <- c(Phone="9999-9999-9999")
##D  rforcecom.update(session, objectName, id, fields)
##D      
##D  # Upsert a record
##D  objectName <- "Account";
##D  externalIdField <- "AccountMaster__c"
##D  externalId <- "AM-00000151"
##D  fields <- c(Name="ABC Network Company", Phone="3333-3333-3333")
##D  rforcecom.upsert(session, objectName, externalIdField, externalId, fields)
##D      
##D  # Delete a record
##D  objectName <- "Account";
##D  id <- "999x000000xxxxxZZZ"
##D  rforcecom.delete(session, objectName, id)
##D      
##D  # Retrieve a server timestamp
##D  rforcecom.getServerTimestamp(session)
##D  
##D  # Logout
##D  rforcecom.logout(session)
##D  
##D  ####
##D  # Using the Bulk API
##D  ####
##D  
##D  # Sign in to the Force.com
##D  username <- "yourname@yourcompany.com"
##D  password <- "YourPasswordSECURITY_TOKEN"
##D  instanceURL <- "https://xxx.salesforce.com/"
##D  apiVersion <- "34.0"
##D  session <- rforcecom.login(username, password, instanceURL, apiVersion)
##D  
##D  
##D  ## BULK INSERT
##D  
##D  # create a sample data.frame of 1000 records
##D  n <- 1000
##D  data <- data.frame(Name=paste('New Record:', 1:n), 
##D                     stringsAsFactors=FALSE)
##D  
##D  # run an insert job into the Account object
##D  job_info <- rforcecom.createBulkJob(session, 
##D                                      operation='insert', 
##D                                      object='Account')
##D  
##D  # split into batch sizes of 500 (2 batches for our 1000 row sample dataset)
##D  batches_info <- rforcecom.createBulkBatch(session, 
##D                                            jobId=job_info$id, 
##D                                            data, 
##D                                            multiBatch = TRUE, 
##D                                            batchSize=500)
##D  
##D  # check on status of each batch
##D  batches_status <- lapply(batches_info, 
##D                           FUN=function(x){
##D                            rforcecom.checkBatchStatus(session, 
##D                                                       jobId=x$jobId, 
##D                                                       batchId=x$id)
##D                                                       })
##D  # get details on each batch
##D  batches_detail <- lapply(batches_info, 
##D                           FUN=function(x){
##D                            rforcecom.getBatchDetails(session, 
##D                                                      jobId=x$jobId, 
##D                                                      batchId=x$id)
##D                                                      })
##D  # close the job
##D  close_job_info <- rforcecom.closeBulkJob(session, jobId=job_info$id)
##D  
##D  
##D  ## BULK DELETE THE PRIOR INSERT
##D  
##D  # format the data
##D  batch_details_together <- plyr::ldply(batches_detail)
##D  delete_ids <- data.frame(id=batch_details_together[,"Id"], 
##D                           stringsAsFactors=FALSE)
##D  
##D  job_info <- rforcecom.createBulkJob(session, operation='delete', object='Account')
##D  batches_info <- rforcecom.createBulkBatch(session, 
##D                                            jobId=job_info$id, 
##D                                            data=delete_ids)
##D  # check on status of each batch
##D  batches_status <- lapply(batches_info, 
##D                           FUN=function(x){
##D                            rforcecom.checkBatchStatus(session, 
##D                                                       jobId=x$jobId, 
##D                                                       batchId=x$id)
##D                                                       })
##D  # get details on each batch
##D  batches_detail <- lapply(batches_info, 
##D                           FUN=function(x){
##D                            rforcecom.getBatchDetails(session, 
##D                                                      jobId=x$jobId, 
##D                                                      batchId=x$id)
##D                                                      })
##D  # close the job
##D  close_job_info <- rforcecom.closeBulkJob(session, jobId=job_info$id)
##D  
##D  
##D  ## BULK QUERY
##D  
##D  query <- "SELECT Id, Name FROM Account LIMIT 10"
##D  job_info <- rforcecom.createBulkJob(session, operation='query', object='Account')
##D  batch_query_info <- rforcecom.submitBulkQuery(session, 
##D                                                jobId=job_info$id, 
##D                                                query=query)
##D                                                
##D  batch_query_status <- rforcecom.checkBatchStatus(session, 
##D                                                   jobId=batch_query_info$jobId, 
##D                                                   batchId=batch_query_info$id)
##D                                                   
##D  batch_query_details <- rforcecom.getBatchDetails(session, 
##D                                                   jobId=batch_query_info$jobId, 
##D                                                   batchId=batch_query_info$id)
##D                                                  
##D  batch_query_recordset <- rforcecom.getBulkQueryResult(session, 
##D                                                        jobId=batch_query_info$jobId, 
##D                                                        batchId=batch_query_info$id, 
##D                                                        resultId=batch_query_details$result)
##D  close_job_info <- rforcecom.closeBulkJob(session, jobId=job_info$id)
##D  
##D  
##D  ## BULK INSERT ATTACHMENTS
##D  
##D  # prepare your .zip file and request.txt manifest before calling these functions
##D  file <- 'request.zip'
##D  job_info <- rforcecom.createBulkJob(session, operation='insert', object='Attachment')
##D  batch_attachment_info <- rforcecom.insertBulkAttachments(session, 
##D                                                           jobId=job_info$id, 
##D                                                           file=file)
##D  batch_attachment_status <- rforcecom.checkBatchStatus(session, 
##D                                                        jobId=batch_attachment_info$jobId, 
##D                                                        batchId=batch_attachment_info$id)
##D  batch_attachment_details <- rforcecom.getBatchDetails(session, 
##D                                                        jobId=batch_attachment_info$jobId, 
##D                                                        batchId=batch_attachment_info$id)
##D  # close the job
##D  close_job_info <- rforcecom.closeBulkJob(session, jobId=job_info$id)
##D  
##D  
## End(Not run)



