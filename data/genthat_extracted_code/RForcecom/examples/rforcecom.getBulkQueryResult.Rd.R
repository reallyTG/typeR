library(RForcecom)


### Name: rforcecom.getBulkQueryResult
### Title: Retrieving the Results of a Bulk Query Batch in a Bulk API Job
### Aliases: rforcecom.getBulkQueryResult

### ** Examples

## Not run: 
##D result <- rforcecom.getBatchDetails(session, 
##D                                     jobId=batch_query_info$jobId, 
##D                                     batchId=batch_query_info$id)
##D recordset <- rforcecom.getBulkQueryResult(session, 
##D                                           jobId=batch_query_info$jobId, 
##D                                           batchId=batch_query_info$id, 
##D                                           resultId=result$result)
## End(Not run)



