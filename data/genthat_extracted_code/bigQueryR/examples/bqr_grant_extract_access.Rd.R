library(bigQueryR)


### Name: bqr_grant_extract_access
### Title: Grant access to an extract on Google Cloud Storage
### Aliases: bqr_grant_extract_access

### ** Examples


## Not run: 
##D library(bigQueryR)
##D 
##D ## Auth with a project that has at least BigQuery and Google Cloud Storage scope
##D bqr_auth()
##D 
##D ## make a big query
##D job <- bqr_query_asynch("your_project", 
##D                         "your_dataset",
##D                         "SELECT * FROM blah LIMIT 9999999", 
##D                         destinationTableId = "bigResultTable")
##D                         
##D ## poll the job to check its status
##D ## its done when job$status$state == "DONE"
##D bqr_get_job("your_project", job$jobReference$jobId)
##D 
##D ##once done, the query results are in "bigResultTable"
##D ## extract that table to GoogleCloudStorage:
##D # Create a bucket at Google Cloud Storage at 
##D # https://console.cloud.google.com/storage/browser
##D 
##D job_extract <- bqr_extract_data("your_project",
##D                                 "your_dataset",
##D                                 "bigResultTable",
##D                                 "your_cloud_storage_bucket_name")
##D                                 
##D ## poll the extract job to check its status
##D ## its done when job$status$state == "DONE"
##D bqr_get_job("your_project", job_extract$jobReference$jobId)
##D 
##D ## to download via a URL and not logging in via Google Cloud Storage interface:
##D ## Use an email that is Google account enabled
##D ## Requires scopes:
##D ##  https://www.googleapis.com/auth/devstorage.full_control
##D ##  https://www.googleapis.com/auth/cloud-platform
##D ## set via options("bigQueryR.scopes") and reauthenticate if needed
##D 
##D download_url <- bqr_grant_extract_access(job_extract, "your@email.com")
##D 
##D ## download_url may be multiple if the data is > 1GB
##D 
## End(Not run)




