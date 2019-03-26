library(googleCloudStorageR)


### Name: gcs_upload
### Title: Upload a file of arbitrary type
### Aliases: gcs_upload

### ** Examples


## Not run: 
##D 
##D ## set global bucket so don't need to keep supplying in future calls
##D gcs_global_bucket("my-bucket")
##D 
##D ## by default will convert dataframes to csv
##D gcs_upload(mtcars)
##D 
##D ## mtcars has been renamed to mtcars.csv
##D gcs_list_objects()
##D 
##D ## to specify the name, use the name argument
##D gcs_upload(mtcars, name = "my_mtcars.csv")
##D 
##D ## when looping, its best to specify the name else it will take
##D ## the deparsed function call e.g. X[[i]]
##D my_files <- list.files("my_uploads")
##D lapply(my_files, function(x) gcs_upload(x, name = x))
##D 
##D ## you can supply your own function to transform R objects before upload
##D f <- function(input, output){
##D   write.csv2(input, file = output)
##D }
##D 
##D gcs_upload(mtcars, name = "mtcars_csv2.csv", object_function = f)
##D 
## End(Not run)






