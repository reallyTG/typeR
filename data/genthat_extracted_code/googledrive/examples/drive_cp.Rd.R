library(googledrive)


### Name: drive_cp
### Title: Copy a Drive file
### Aliases: drive_cp

### ** Examples

## Not run: 
##D ## Create a file to copy
##D file <- drive_upload(drive_example("chicken.txt"), "chicken-cp.txt")
##D 
##D ## Make a "Copy of" copy in same folder as the original
##D drive_cp("chicken-cp.txt")
##D 
##D ## Make an explicitly named copy in same folder as the original
##D drive_cp("chicken-cp.txt", "chicken-cp-two.txt")
##D 
##D ## Make an explicitly named copy in a different folder
##D folder <- drive_mkdir("new-folder")
##D drive_cp("chicken-cp.txt", path = folder, name = "chicken-cp-three.txt")
##D 
##D ## Make an explicitly named copy and star it.
##D ## The starring is an example of providing metadata via `...`.
##D ## `starred` is not an actual argument to `drive_cp()`,
##D ## it just gets passed through to the API.
##D drive_cp("chicken-cp.txt", name = "chicken-cp-starred.txt", starred = TRUE)
##D 
##D ## Behold all of our copies!
##D drive_find("chicken-cp")
##D 
##D ## Delete all of our copies and the new folder!
##D drive_find("chicken-cp") %>% drive_rm()
##D drive_rm(folder)
##D 
##D ## upload a csv file to copy
##D csv_file <- drive_upload(drive_example("chicken.csv"))
##D 
##D ## copy AND AT THE SAME TIME convert it to a Google Sheet
##D chicken_sheet <- drive_cp(
##D   csv_file,
##D   name = "chicken-cp",
##D   mime_type = drive_mime_type("spreadsheet")
##D )
##D 
##D ## go see the new Sheet in the browser
##D ## drive_browse(chicken_sheet)
##D 
##D ## clean up
##D drive_rm(csv_file, chicken_sheet)
## End(Not run)



