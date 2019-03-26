library(bigQueryR)


### Name: bqr_download_query
### Title: Download data from BigQuery to local folder
### Aliases: bqr_download_query

### ** Examples


## Not run: 
##D library(bigQueryR)
##D 
##D ## Auth with a project that has at least BigQuery and Google Cloud Storage scope
##D bqr_auth()
##D 
##D # Create a bucket at Google Cloud Storage at 
##D # https://console.cloud.google.com/storage/browser
##D 
##D bqr_download_query(query = "select * from `your_project.your_dataset.your_table`")
##D 
## End(Not run)




