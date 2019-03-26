library(REDCapR)


### Name: redcap_upload_file_oneshot
### Title: Upload a file into to a REDCap project record.
### Aliases: redcap_upload_file_oneshot

### ** Examples

## Not run: 
##D #Define some constants
##D uri       <- "https://bbmc.ouhsc.edu/redcap/api/"
##D token     <- "D70F9ACD1EDD6F151C6EA78683944E98" #For the simple project (pid 213)
##D field     <- "mugshot"
##D event     <- "" # only for longitudinal events
##D 
##D #Upload a single image file.
##D record    <- 1
##D file_path <- base::file.path(devtools::inst(name="REDCapR"), paste0("test-data/mugshot-1.jpg"))
##D 
##D redcap_upload_file_oneshot(
##D   file_name=file_path, record=record, field=field,
##D   redcap_uri=redcap_uri, token=token
##D )
##D 
##D #Upload a collection of five images.
##D records   <- 1:5
##D file_paths <- base::file.path(
##D   devtools::inst(name="REDCapR"),
##D   paste0("test-data/mugshot-", records, ".jpg")
##D )
##D 
##D for( i in seq_along(records) ) {
##D   record    <- records[i]
##D   file_path <- file_paths[i]
##D   redcap_upload_file_oneshot(
##D     file_name=file_path, record=record, field=field,
##D     redcap_uri=redcap_uri, token=token
##D   )
##D }
## End(Not run)



