library(googleCloudStorageR)


### Name: gcs_get_object
### Title: Get an object in a bucket directly
### Aliases: gcs_get_object

### ** Examples


## Not run: 
##D 
##D ## something to download
##D ## data.frame that defaults to be called "mtcars.csv"
##D gcs_upload(mtcars)
##D 
##D ## get the mtcars csv from GCS, convert it to an R obj
##D gcs_get_object("mtcars.csv")
##D 
##D ## get the mtcars csv from GCS, save it to disk
##D gcs_get_object("mtcars.csv", saveToDisk = "mtcars.csv")
##D 
##D 
##D ## default gives a warning about missing column name.
##D ## custom parse function to suppress warning
##D f <- function(object){
##D   suppressWarnings(httr::content(object, encoding = "UTF-8"))
##D }
##D 
##D ## get mtcars csv with custom parse function.
##D gcs_get_object("mtcars_meta.csv", parseFunction = f)
##D 
## End(Not run)




