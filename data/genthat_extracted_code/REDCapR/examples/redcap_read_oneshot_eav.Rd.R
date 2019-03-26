library(REDCapR)


### Name: redcap_read_oneshot_eav
### Title: Read/Export records from a REDCap project.
### Aliases: redcap_read_oneshot_eav

### ** Examples

## Not run: 
##D library(REDCapR) #Load the package into the current R session.
##D uri      <- "https://bbmc.ouhsc.edu/redcap/api/"
##D token    <- "9A81268476645C4E5F03428B8AC3AA7B"
##D #Return all records and all variables.
##D ds_all_rows_all_fields <- redcap_read_oneshot_eav(redcap_uri=uri, token=token)$data
##D 
##D #Return only records with IDs of 1 and 3
##D desired_records_v1 <- c(1, 3)
##D ds_some_rows_v1 <- redcap_read_oneshot_eav(
##D    redcap_uri = uri,
##D    token      = token,
##D    records    = desired_records_v1
##D )$data
##D 
##D #Return only the fields record_id, name_first, and age
##D desired_fields_v1 <- c("record_id", "name_first", "age")
##D ds_some_fields_v1 <- redcap_read_oneshot_eav(
##D    redcap_uri = uri,
##D    token      = token,
##D    fields     = desired_fields_v1
##D )$data
## End(Not run)



