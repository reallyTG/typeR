library(googledrive)


### Name: drive_download
### Title: Download a Drive file
### Aliases: drive_download

### ** Examples

## Not run: 
##D ## Upload a csv file into a Google Sheet
##D file <- drive_upload(
##D   drive_example("chicken.csv"),
##D   type = "spreadsheet"
##D   )
##D 
##D ## Download Sheet as csv, explicit type
##D (downloaded_file <- drive_download(file, type = "csv"))
##D 
##D ## See local path to new file
##D downloaded_file$local_path
##D 
##D ## Download as csv, type implicit in file extension
##D drive_download(file, path = "my_csv_file.csv")
##D 
##D ## Download with default name and type (xlsx)
##D drive_download(file)
##D 
##D ## Clean up
##D unlink(c("chicken.csv", "chicken.csv.xlsx", "my_csv_file.csv"))
##D drive_rm(file)
## End(Not run)



