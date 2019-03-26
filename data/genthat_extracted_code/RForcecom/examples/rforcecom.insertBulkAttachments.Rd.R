library(RForcecom)


### Name: rforcecom.insertBulkAttachments
### Title: Insert Attachments via Bulk API Job
### Aliases: rforcecom.insertBulkAttachments

### ** Examples

## Not run: 
##D 
##D # sample .zip directory structure
##D request.zip
##D   request.txt
##D   attachment1.gif
##D   subdir/
##D     attachment2.doc
##D     
##D # sample format of request.txt
##D Name,ParentId,Body
##D attachment1.gif,TheTargetRecordIdHere,#attachment1.gif
##D subdir/attachment2.doc,TheTargetRecordIdHere,#subdir/attachment2.doc
##D 
##D f <- 'request.zip'
##D batch_attachment_info <- rforcecom.insertBulkAttachments(session, jobId=job_info$id, file=f)
## End(Not run)



