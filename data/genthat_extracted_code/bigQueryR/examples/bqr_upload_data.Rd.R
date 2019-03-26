library(bigQueryR)


### Name: bqr_upload_data
### Title: Upload data to BigQuery
### Aliases: bqr_upload_data

### ** Examples


## Not run: 
##D 
##D  library(googleCloudStorageR)
##D  library(bigQueryR)
##D  
##D  gcs_global_bucket("your-project")
##D  
##D  ## custom upload function to ignore quotes and column headers
##D  f <- function(input, output) {
##D    write.table(input, sep = ",", col.names = FALSE, row.names = FALSE, 
##D                quote = FALSE, file = output, qmethod = "double")}
##D    
##D  ## upload files to Google Cloud Storage
##D  gcs_upload(mtcars, name = "mtcars_test1.csv", object_function = f)
##D  gcs_upload(mtcars, name = "mtcars_test2.csv", object_function = f)
##D  
##D  ## create the schema of the files you just uploaded
##D  user_schema <- schema_fields(mtcars)
##D  
##D  ## load files from Google Cloud Storage into BigQuery
##D  bqr_upload_data(projectId = "your-project", 
##D                 datasetId = "test", 
##D                 tableId = "from_gcs_mtcars", 
##D                 upload_data = c("gs://your-project/mtcars_test1.csv", 
##D                                 "gs://your-project/mtcars_test2.csv"),
##D                 schema = user_schema)
##D  
##D  ## for big files, its helpful to create your schema on a small sample
##D  ## a quick way to do this on the command line is:
##D  # "head bigfile.csv > head_bigfile.csv"
##D 
##D 
##D 
## End(Not run)




