library(REDCapR)


### Name: redcap_download_file_oneshot
### Title: Download a file from a REDCap project record.
### Aliases: redcap_download_file_oneshot

### ** Examples

## Not run: 
##D uri     <- "https://bbmc.ouhsc.edu/redcap/api/"
##D token   <- "D70F9ACD1EDD6F151C6EA78683944E98" #pid=213
##D record  <- 1
##D field   <- "mugshot"
##D # event <- "" # only for longitudinal events
##D 
##D result_1 <- redcap_download_file_oneshot(
##D   record        = record,
##D   field         = field,
##D   redcap_uri    = uri,
##D   token         = token
##D )
##D base::unlink("mugshot-1.jpg")
##D 
##D (full_name <- base::tempfile(pattern="mugshot", fileext=".jpg"))
##D result_2 <- redcap_download_file_oneshot(
##D   file_name    = full_name,
##D   record       = record,
##D   field        = field,
##D   redcap_uri   = uri,
##D   token        = token
##D )
##D base::unlink(full_name)
##D 
##D (relative_name <- "ssss.jpg")
##D result_3 <- redcap_download_file_oneshot(
##D   file_name    = relative_name,
##D   record       = record,
##D   field        = field,
##D   redcap_uri   = uri,
##D   token        = token
##D )
##D base::unlink(relative_name)
## End(Not run)



